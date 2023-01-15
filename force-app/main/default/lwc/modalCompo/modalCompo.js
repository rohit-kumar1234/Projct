import { LightningElement,track } from 'lwc';

export default class ModalCompo extends LightningElement {
   /* inputArray = [
        {
            idx:0
        }
    ]*/
    value = ''
    flag = false
    get options() {
        return [
            { label: '75%', value: 'SevenFive' },
            { label: '25%', value: 'TwoFive' },
        ];
    }
    keyIndex = 0;
    @track itemList = [
        {
            id: 0
        }
    ];
    handleRadioChange(eve){
        const val = eve.detail.value
       if(eve.detail.value == 'SevenFive'){
            this.flag = true
        }
        else{
            this.flag = false
        }
    }
    handleAdd(eve) {
        ++this.keyIndex;
        var newItem = [{ id: this.keyIndex }];//id:1
        this.itemList = this.itemList.concat(newItem);//[{id:0},{id:1}]
    }

    handleDelete(event) {
        if (this.itemList.length >= 2) {
            this.itemList = this.itemList.filter(function (element) {
                return parseInt(element.id) !== parseInt(event.target.accessKey);
            });
        }
    }

    handleFinish(event){
        var isVal = true;
       /* this.template.querySelectorAll('lightning-input-field').forEach(element => {
            isVal = isVal && element.reportValidity();
        });*/
        if (isVal) {
            this.template.querySelectorAll('lightning-record-edit-form').forEach(element => {
                element.submit();
            });
    }
}
    handleCancel(event){
        this.flag = false
        this.value = ''
    }
}
