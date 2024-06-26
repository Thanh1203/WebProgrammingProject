import { translate } from "@/languages/i18n";
import type { RouteRecordRaw } from "vue-router";
import defaultLayout from "@/components/layouts/defaultLayout/index.vue";
import detailLayout from "@/components/layouts/detailLayout/index.vue";

export default (): RouteRecordRaw[] => {
  return [
    {
      path: "/sign-in",
      name: "signIn",
      component: () => import("./Login/index.vue"),
      meta: {
        title: translate("SignIn"),
        publicRoute: true,
      },
    },
    {
      path: "/",
      name: "dashboard",
      component: () => import("./dashboard/index.vue"),
      meta: {
        title: translate("Dashboard"),
        layout: defaultLayout,
      },
    },
    {
      path: "/information",
      name: "information",
      component: () => import("./information/index.vue"),
      meta: {
        title: translate("Information"),
      },
    },
    {
      path: "/setting",
      name: "setting",
      component: () => import("./setting/index.vue"),
      meta: {
        title: translate("Setting"),
        layout: defaultLayout,
      },
    },
    {
      path: "/customer-report",
      name: "customer report",
      component: () => import("./reports/customer-report/index.vue"),
      meta: {
        title: translate("CustomerReport"),
        layout: defaultLayout,
      },
    },
    {
      path: "/product-report",
      name: "product report",
      component: () => import("./reports/product-report/index.vue"),
      meta: {
        title: translate("ProductReport"),
        layout: defaultLayout,
      },
    },
    {
      path: "/sale-report",
      name: "sale report",
      component: () => import("./reports/sale-report/index.vue"),
      meta: {
        title: translate("SalesReport"),
        layout: defaultLayout,
      },
    },
    {
      path: "/personnal",
      name: "personnal",
      component: () => import("./personnel/index.vue"),
      meta: {
        title: translate("Personnel"),
        layout: defaultLayout,
      },
    },
    {
      path: "/warehouse-configuration",
      name: "warehouse configuration",
      component: () => import("./warehouse/warehouse-setting/index.vue"),
      meta: {
        title: translate("Warehouse"),
        layout: defaultLayout,
      },
    },
    {
      path: "/product-category",
      name: "product category",
      component: () => import("./products/product-category/index.vue"),
      meta: {
        title: translate("ProductCategory"),
        layout: defaultLayout,
      },
    },
    {
      path: "/product-information",
      name: "product information",
      component: () => import("./products/product-information/index.vue"),
      meta: {
        title: translate("ProductInformation"),
        layout: defaultLayout,
      },
    },
    {
      path: "/warehouse-import",
      name: "warehouse import",
      component: () => import("./warehouse/warehouse-import/index.vue"),
      meta: {
        title: translate("EnterWarehouse"),
        layout: defaultLayout,
      },
    },
    {
      path: "/warehouse-export",
      name: "warehouse export",
      component: () => import("./warehouse/warehouse-export/index.vue"),
      meta: {
        title: translate("ExportWarehouse"),
        layout: defaultLayout,
      },
    },
    {
      path: "/product-classify",
      name: "product classify",
      component: () => import("./products/product-classify/index.vue"),
      meta: {
        title: translate("ProductClassify"),
        layout: defaultLayout,
      },
    },
    {
      path: "/product-producer",
      name: "product producer",
      component: () => import("./products/product-producer/index.vue"),
      meta: {
        title: translate("Producer"),
        layout: defaultLayout,
      },
    },
    {
      path: "/forgot-password",
      name: "forgot password",
      component: () => import("./forgot-password/index.vue"),
      meta: {
        title: translate("ForgotPassword"),
      },
    },
    {
      path: "/import-goods/:id",
      name: "import goods",
      component: () => import("./warehouse/warehouse-import/components/importGoods.vue"),
      meta: {
        title: translate("ImportGoods"),
        layout: detailLayout,
      },
    },
    {
      path: "/export-goods/:id",
      name: "export goods",
      component: () => import("./warehouse/warehouse-export/components/exportGoods.vue"),
      meta: {
        title: translate("ImportGoods"),
        layout: detailLayout,
      },
    },
    {
      path: "/price-configuration",
      name: "price configuuration",
      component: () => import("./price-config/index.vue"),
      meta: {
        title: translate('PriceConfiguration'),
        layout: defaultLayout,
      }
    },
  ];
};
