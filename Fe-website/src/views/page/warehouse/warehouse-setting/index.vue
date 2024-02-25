<template>
<a-form class="tw-flex tw-justify-start tw-items-start tw-rounded-lg tw-bg-white tw-px-6 tw-py-5 tw-mb-6 filter-section">
    <a-form-item class="tw-w-[250px]">
        <span class="tw-text-xs">{{ translate('EnterWarehouseName') }}</span>
        <a-input :placeholder="translate('Search')" v-model:value="filterSearching.keyword"/>
    </a-form-item>
    <a-form-item class="tw-w-[150px]">
        <span class="tw-text-xs">Chọn quốc gia</span>
        <a-select :placeholder="translate('Nation')" v-model:value="filterSearching.nationSlected" :options="option1Fake"/>
    </a-form-item>
    <a-form-item class="tw-w-[150px]">
        <span class="tw-text-xs">Chọn khu vực</span>
        <a-select :placeholder="'Khu vực'" v-model:value="filterSearching.areaSelected" :options="option2Fake" :allowClear="true"/>
    </a-form-item>
    <a-form-item class="tw-flex tw-items-end">
        <AntdButton :type="'text'" danger :disabled="disabledDeleteFilter" @click="handleClearFilter">
            <template #icon>
                <font-awesome-icon :icon="['far', 'trash-can']" />
            </template>
            <span class="tw-ml-2">Xóa</span> 
        </AntdButton>
    </a-form-item>
</a-form>
<Section :title="'Danh sách kho'" :sub-title="'Số lượng kho hàng :'" :number="String(datafake?.length)">
    <template #action>
        <AntdButton :type="'text'" danger class="tw-mr-2" :disabled="disableDeleteRow" @click="preDeleteRow">
            <template #icon>
                <font-awesome-icon :icon="['far', 'trash-can']"/>
            </template>
            <span class="tw-text-sm tw-ml-2">Xóa <span v-if="listSelect?.length > 0">({{ listSelect?.length }})</span></span>
        </AntdButton>
        <AntdButton :type="'primary'" @click="handleCreateRow">
            <template #icon>
                <font-awesome-icon :icon="['fas', 'plus']"/>
            </template>
            <span class="tw-text-sm tw-ml-2">Thêm mới</span>
        </AntdButton>
    </template>
    <template #body>
        <AntdTable 
        ref="table"
        key-field="warehouseId"
        :index-column="true"
        :columns="columns"
        :data-source="datafake"
        :has-checkbox="true"
        :no-sort="true"
        @on-selected="handleSelectRow"
        >
            <template #custom-body="{column, record}">
                <template v-if="column.key === 'action'">
                    <div class="action">
                        <AntdButton class="action-btn" :type="'light-hover'" shape="circle" @click="handleViewRow(record)">
                            <font-awesome-icon :icon="['fas', 'circle-info']" style="color: #4CAF50;" />
                        </AntdButton>
                        <AntdButton class="action-btn" :type="'light-hover'" shape="circle" @click="handleEditRow(record)">
                            <font-awesome-icon :icon="['far', 'pen-to-square']" style="color: #001F3F;"/>
                        </AntdButton>
                        <AntdButton class="action-btn" :type="'light-hover'" shape="circle" @click="deleteSingleRow">
                            <font-awesome-icon :icon="['far', 'trash-can']" style="color: #FF0000;" />
                        </AntdButton>
                    </div>
                </template>
            </template>
        </AntdTable>
    </template>
</Section>
<!-- modal -->
<ModalCreate :is-visible="isVisibleModalCreate" :is-edit="isEdit" :form="formState" @close-modal="closeModal" @handle-submit="handleSubmitForm"/>
<ModalConfirm :is-visible="isVisibleModalConfirm" @close-modal="closeModal" @handle-submit="handleDeleteManyRow" :title-modal="messConfirmRows || messConfirmSingleRow"/>
<ModalInfo :is-visible="isVisibleModalInfo" @close-modal="closeModal" :state="formState"/>
</template>
<script setup lang="ts">
import Section from "@/components/section/index.vue";
import { ref, watch, onMounted, defineAsyncComponent, reactive, computed } from 'vue';
import { translate } from "@/languages/i18n";
import AntdButton from "@/components/antd-button/index.vue";
import AntdTable from "@/components/antd-table/index.vue";

const ModalCreate = defineAsyncComponent(() => import("./components/ModalCreate.vue"));
const ModalConfirm = defineAsyncComponent(() => import("@/components/antd-modal-confirm/index.vue"));
const ModalInfo = defineAsyncComponent(() => import("./components/ModalInfo.vue"));

const isVisibleModalCreate = ref<boolean>(false);
const isVisibleModalConfirm = ref<boolean>(false);
const isVisibleModalInfo = ref<boolean>(false);
const isEdit = ref<boolean>(false);
const listSelect = ref<Array<any>>([]);
const columns = ref<Array<any>>([
    {
        title: "Mã kho",
        dataIndex: "warehouseId",
        key: "warehouseId",
        align: "left"
    },
    {
        title: translate('warehouseName'),
        dataIndex: "warehouseName",
        key: "warehouseName",
        align: "left"
    },
    {
        title: translate('Nation'),
        dataIndex: "Nation",
        key: "Nation",
        align: "left"
    },
    {
        title: translate('Area'),
        dataIndex: "Area",
        key: "Area",
        align: "left"
    },
    {
        title: translate('DateCreated'),
        dataIndex: "DateCreated",
        key: "DateCreated",
        aligin: "left"
    },
    {
        dataIndex: "action",
        key: "action",
        width: 100,
        align: "center",
        fixed: "right",
    },
]);
const messConfirmRows = ref<any>("");
const messConfirmSingleRow = ref<any>("");

const filterSearching = reactive({
    keyword: "",
    nationSlected: null,
    areaSelected: null
});
const formState = reactive({
    warehouseId:  "",
    warehouseName: "",
    Nation: "",
    Area: "",
    describe: "",
    DateCreated: "",
    Acreage: null,
    Tankage: null,
})

const disabledDeleteFilter = computed(() => filterSearching?.keyword?.length === 0 && filterSearching?.nationSlected === null && filterSearching?.areaSelected === null);

const handleClearFilter = () => {
    filterSearching.keyword = "";
    filterSearching.nationSlected = null;
    filterSearching.areaSelected = null;
};

// modal create
const handleCreateRow = () => {
    isVisibleModalCreate.value = true;
    isEdit.value = false;
    formState.warehouseName = "";
    formState.Nation = "";
    formState.Area = "";
    formState.describe = "";
    formState.DateCreated = "";
    formState.Acreage = null;
    formState.Tankage = null;
    formState.warehouseId = "";
};

const closeModal = () => {
    isVisibleModalCreate.value = false;
    isVisibleModalConfirm.value = false;
    isVisibleModalInfo.value = false;
};

const handleSubmitForm = (state: any) => {
    isVisibleModalCreate.value = false;
    if (isEdit) {
        console.log("edit");
    } else {
        console.log("create");
    }
};

// modal confirm
const preDeleteRow = () => {
    isVisibleModalConfirm.value = true;
    messConfirmRows.value = translate('ConfirmDeletWarehouses');
    messConfirmSingleRow.value = "";
};

// handle data table
const handleSelectRow = (rows: any) => {
    listSelect.value = rows.value.map((x: any) => x?.id);
};

const disableDeleteRow = computed(() => listSelect?.value?.length === 0);

const handleDeleteManyRow = () => {
    isVisibleModalConfirm.value = false;
}

const deleteSingleRow = () => {
    isVisibleModalConfirm.value = true;
    messConfirmRows.value = "";
    messConfirmSingleRow.value = "Bạn có chắc chắn muốn xóa kho hàng này?";
}

const handleViewRow = (data: any) => {
    isVisibleModalInfo.value = true;
    formState.warehouseName = data.warehouseName;
    formState.Nation = data.Nation;
    formState.Area = data.Area;
    formState.describe = data.describe;
    formState.DateCreated = data.DateCreated;
    formState.Acreage = data.Acreage;
    formState.Tankage = data.Tankage;
    formState.warehouseId = data.warehouseId;
}

const handleEditRow = (data: any) => {
    isEdit.value = true;
    isVisibleModalCreate.value = true;
    formState.warehouseName = data.warehouseName;
    formState.Nation = data.Nation;
    formState.Area = data.Area;
    formState.describe = data.describe;
    formState.DateCreated = data.DateCreated;
    formState.Acreage = data.Acreage;
    formState.Tankage = data.Tankage;
    formState.warehouseId = data.warehouseId;
}
//data fake
const datafake = [
    {
        warehouseId: "WH01",
        warehouseName: "Kho hàng 1",
        Nation: "Việt Nam",
        Area: "Hà nội",
        describe: "Số 1 Cổ Nhuế Bắc từ Liêm",
        DateCreated: "01/01/2024",
        Acreage: "1000",
        Tankage: "12000"
    },
    {
        warehouseId: "WH02",
        warehouseName: "Kho hàng 2",
        Nation: "Việt Nam",
        Area: "Hà nội",
        describe: "Số 1 Cổ Linh Long Biên",
        DateCreated: "01/01/2024",
        Acreage: "1000",
        Tankage: "12000"
    },
    {
        warehouseId: "WH03",
        warehouseName: "Kho hàng 3",
        Nation: "Việt Nam",
        Area: "Hà nội",
        describe: "Số 1 Âu Cơ Tây Hồ",
        DateCreated: "01/01/2024",
        Acreage: "1000",
        Tankage: "12000"
    },
    {
        warehouseId: "WH04",
        warehouseName: "Kho hàng 4",
        Nation: "Việt Nam",
        Area: "Hà nội",
        describe: "Số 1 Cầu Giấy Cầu Giấy",
        DateCreated: "01/01/2024",
        Acreage: "1000",
        Tankage: "12000"
    },
    {
        warehouseId: "WH05",
        warehouseName: "Kho hàng 5",
        Nation: "Việt Nam",
        Area: "Hà nội",
        describe: "Số 1 Minh Khai Hai Bà Trưng",
        DateCreated: "01/01/2024",
        Acreage: "1000",
        Tankage: "12000"
    }
];

const option1Fake = [
    {
        value: 1,
        label: "Việt Nam"
    },
    {
        value: 2,
        label: "Lào"
    }
];

const option2Fake = [
    {
        value: 1,
        label: "Hà nội"
    },
    {
        value: 2,
        label: "Hải dương"
    },
]

</script>
<style scoped lang="scss"></style>