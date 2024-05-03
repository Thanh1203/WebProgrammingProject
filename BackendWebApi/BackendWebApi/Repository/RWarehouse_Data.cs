﻿using BackendWebApi.Data;
using BackendWebApi.DTOS;
using BackendWebApi.Interfaces;
using BackendWebApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BackendWebApi.Repository
{
    public class RWarehouse_Data(DataContext context) : IWarehouse_Data
    {
        private readonly DataContext _context = context;

        public async Task UpdateUnitPrice(int idWarehouse, int productId, double unitPrice)
        {
            var temp = _context.Warehouse_Data.SingleOrDefault(e => e.IdWarehouse== idWarehouse && e.IdProduct == productId);

            if (temp != null)
            {
                temp.UnitPrice = unitPrice;
            }

            await _context.SaveChangesAsync();
        }

        public async Task InsertProduct(DTOWarehouseData_Create? data_Create)
        {
            foreach (var item in data_Create.DataInsert)
            {
                var newWarehouseData = new Warehouse_Data
                {
                    IdWarehouse = data_Create.IdWarehouse,
                    IdProduct = item.Idroduct,
                    CodeProduct = item.CodeProduct,
                    CompanyId = 1,
                    Quantity = item.Quantity,
                    UnitPrice = 0,
                };
                _context.Warehouse_Data.Add(newWarehouseData);
                await _context.SaveChangesAsync();
            }

            var newWarehouseImport = new Warehouse_Import
            {

                WarehouseId = data_Create.IdWarehouse,
                TotalProduct = data_Create.TotalProduct,
                CompanyId = 1,
                DateTime = DateTime.UtcNow,
                Code = "GsI" + 1.ToString() + GenerateRandomString() + DateTimeOffset.UtcNow.ToString("yyyyHHddMMfffmmss")
            };
            _context.Warehouse_Imports.Add(newWarehouseImport);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateQuantityProduct(DTOWarehouseData_Update? data_Update)
        {
            foreach (var item in data_Update.DataUpdate)
            {
                var itemUpdate = _context.Warehouse_Data.SingleOrDefault(e => e.IdProduct == item.Idroduct && e.CompanyId == 1 && e.IdWarehouse == data_Update.IdWarehouse);
                if (itemUpdate != null)
                {
                    itemUpdate.Quantity += item.Quantity;
                }

                await _context.SaveChangesAsync();
            }

            var newWarehouseImport = new Warehouse_Import
            {

                WarehouseId = data_Update.IdWarehouse,
                TotalProduct = data_Update.TotalProduct,
                CompanyId = 1,
                DateTime = DateTime.UtcNow,
                Code = "GsI" + 1.ToString() + GenerateRandomString() + DateTimeOffset.UtcNow.ToString("yyyyHHddMMfffmmss")
            };
            _context.Warehouse_Imports.Add(newWarehouseImport);
            await _context.SaveChangesAsync();
        }

        public async  Task DecreaseQuantityProduct(DTOWarehouseData_Update? data_Update, DTOCustomer? customer)
        {
            double totalValue = 0;
            foreach (var item in data_Update.DataUpdate)
            {
                var itemUpdate = _context.Warehouse_Data.SingleOrDefault(e => e.IdProduct == item.Idroduct && e.CompanyId == 1 && e.IdWarehouse == data_Update.IdWarehouse);
                if (itemUpdate != null)
                {
                    itemUpdate.Quantity -= item.Quantity;
                    var value = item.Quantity * itemUpdate.UnitPrice;
                    totalValue += value;
                }

                await _context.SaveChangesAsync();
            }

            var newWarehouseExport = new Warehouse_Export
            {

                WarehouseId = data_Update.IdWarehouse,
                TotalProduct = data_Update.TotalProduct,
                CompanyId = 1,
                DateTime = DateTime.UtcNow,
                Code = "GsI" + 1.ToString() + GenerateRandomString() + DateTimeOffset.UtcNow.ToString("yyyyHHddMMfffmmss"),
                TotalValue = totalValue,
            };
            _context.Warehouse_Exports.Add(newWarehouseExport);
            await _context.SaveChangesAsync();

            if (string.IsNullOrWhiteSpace(customer.PhoneNumber))
            {
                return;
            } 
            else
            {
                var currentCustomer = await _context.Customers.SingleOrDefaultAsync(e => e.CompanyId == 1 && e.PhoneNumber.Contains(customer.PhoneNumber));
                if (currentCustomer != null)
                {
                    currentCustomer.TotalValueOrders += totalValue;
                    currentCustomer.PurchaseCount++;
                    currentCustomer.SalePoint += (totalValue >= 100000) ? (int)Math.Floor(totalValue / 1000 * 0.03) : 0;
                    await _context.SaveChangesAsync();
                }
                else
                {
                    var newCustomer = new Customer
                    {
                        PhoneNumber = customer.PhoneNumber,
                        CustomerName = customer.Name,
                        SalePoint = (totalValue >= 100000) ? (int)Math.Floor(totalValue / 1000 * 0.03) : 10,
                        PurchaseCount = 1,
                        Address = customer.Address,
                        DateTime = DateTime.UtcNow,
                        CompanyId = 1,
                        TotalValueOrders = totalValue,
                    };
                    _context.Customers.Add(newCustomer);
                    await _context.SaveChangesAsync();
                }
            }
        }

        static string GenerateRandomString()
        {
            Random random = new Random();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            char[] result = new char[3];

            // Tạo chuỗi ngẫu nhiên có độ dài length ký tự
            for (int i = 0; i < 3; i++)
            {
                result[i] = chars[random.Next(chars.Length)];
            }

            return new string(result);
        }
    }
}
