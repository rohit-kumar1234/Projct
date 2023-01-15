import { LightningElement ,api} from 'lwc';
import createRecord from '@salesforce/apex/OppLineItem.createRecord'
export default class OppLineItem extends LightningElement {
    tableInput=[];
    indexPos=0;
    @api prodctId
    @api opportyId
    tpVal =''
    displayButton
    get tpv(){
        return tpVal
    }
    connectedCallback(){
        this.handleAdd()
    }
    handleAdd(){
        console.log('inside add')
        let currentObj = {
            id          :   ++this.indexPos,
            Description : '',
            Quantity    : '',
            UnitPrice   : '',
            TotalPrice : ''
        }
        console.log('indexpos:: ',this.indexPos)
        this.tableInput = [...this.tableInput,Object.create(currentObj)]
        //this.tableInput = this.tableInput.push(currentObj)
        console.log('tableinput ::--::',this.tableInput)
        console.log('tableinput stst',JSON.stringify(this.tableInput))
        this.displayButton = false

    }
    handleDelete(event){
        console.log('inside delete')
        if(this.tableInput.length > 0){
            console.log('inside delete inside if')
            this.tableInput = this.tableInput.filter((item)=>{
                return parseInt(item.id) !== parseInt(event.currentTarget.dataset.index);
            })
            this.displayButton = false
        }
        --this.indexPos
        for(let i = 0; i < this.tableInput.length; i++) {
            this.tableInput[i].id = i + 1;
        }
        console.log('indexpos:: ',this.indexPos)
        console.log('tableinput ::--::',this.tableInput)
       if(this.indexPos ==0){
        this.displayButton = true
       }

    }
    handleTableData(event){
            let pos = event.currentTarget.dataset.index -1
        if (event.target.name == 'description') {
            this.tableInput[pos].Description = event.target.value;
            console.log('tableinput :--:',this.tableInput)

        }
        else if (event.target.name == 'quantity') {
            this.tableInput[pos].Quantity = event.target.value;
            this.tableInput[pos].TotalPrice = this.tableInput[pos].Quantity * this.tableInput[pos].UnitPrice

            console.log('tableinput :--:',this.tableInput)
           // this.tableInput= JSON.parse(JSON.stringify(this.tableInput))
        }
        else if (event.target.name == 'price') {
            this.tableInput[pos].UnitPrice = event.target.value;
            this.tableInput[pos].TotalPrice = this.tableInput[pos].Quantity * this.tableInput[pos].UnitPrice

            console.log('tableinput :--:',this.tableInput)
        }
        
        this.tableInput = [...this.tableInput]

    }
    handleLineItemClick(){
        this.handleAdd()
    }
    result
    strProdId
    lineItemData
    @api handleCreateRecord(){
        console.log('called handle Ceate Record','ok',this.opportyId)
        this.strProdId = JSON.parse(JSON.stringify(this.prodctId));
        console.log('pro',this.strProdId)
        this.lineItemData = JSON.parse(JSON.stringify(this.tableInput));

        console.log('data',this.lineItemData)
        createRecord({
            listofLineItem: this.lineItemData,
            prodId        :this.strProdId[0],
            oppId         : this.opportyId
        })
            .then(data => {
               this.result = data;
                console.log('success')
            })
            .catch(error => {
                console.log(error);
            });
    }
}