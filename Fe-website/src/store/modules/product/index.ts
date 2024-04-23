import ConstantAPI from "@/services/ConstantAPI";
import { DataService } from "@/services/request";

export interface product {
    productData: any,
    totalElement: number,
}

export default {
    namespaced: true as true,
    state: {
        productData: [],
        totalElement: 0,
    } as product,
    getters: {
        productData: (state) => state.productData,
        totalElement: (state) => state.totalElement,
    },
    mutations: {
        SET_PRODUCT_DATA(state, payload) {
            state.productData = payload
        },
        SET_TOTAL_CATEGORY(state, payload) {
            state.totalElement = payload
        },
    },
    actions: {
        //get
        async getProduct({ commit }, payload) {
            try {
                const response: any = await DataService.callApi(ConstantAPI.product.GET, null, payload);
                await commit("SET_PRODUCT_DATA", response?.data);
                await commit("SET_TOTAL_CATEGORY", response?.totalElement);
            } catch (error) {
                console.log(error);
            }
        },
        //create
        async createProduct({ dispatch }, payload) {
            try {
                const response: any = await DataService.callApi(ConstantAPI.product.CREATE, payload.state, null);
                await dispatch("getProduct", payload.params);
                return response;
            } catch (error) {
                console.log(error);
            }
        },
        //update
        async updateProduct({ dispatch }, payload) {
            try {
                const response: any = await DataService.callApi(ConstantAPI.product.UPDATE, payload.state, null);
                await dispatch("getProduct", payload.params);
                return response;
            } catch (error) {
                console.log(error);
            }
        },
        //delete
        async deleteProduct({ dispatch }, payload) {
            try {
                const response: any = await DataService.callApi(ConstantAPI.product.DELETE, payload.state, null);
                await dispatch("getProduct", payload.params);
                return response;
            } catch (error) {
                console.log(error);
            }
        }
    }
}