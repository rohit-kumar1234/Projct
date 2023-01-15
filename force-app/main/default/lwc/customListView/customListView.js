import { LightningElement ,wire} from 'lwc';
import fetchAccounts from '@salesforce/apex/dataTableHelper.fetchAccounts'
const COLUMNS =[
    {label:'Account Name',fieldName:'AccountUrl', type:'url',sortable:true,typeAttributes: { label: { fieldName: 'Name' }, target: '_blank'} },
    {label:'Annual Revenue' , fieldName:'AnnualRevenue' , type :'currency' , sortable:true},
    {label:'Industry' , fieldName:'Industry' , type :'text' , sortable:true},
    {label:'Phone' , fieldName:'Phone' , type :'phone' , sortable:true}

]

export default class CustomListView extends LightningElement {
    accList 
    miniAccountList
    
    columns = COLUMNS
   /* this.data = result.map(row=>{
        return{...row, caseNumber: '/' + row.Id //extra columns if you want to add any, the standard return from your Apex controller will already be in data});
    this.lstAccounts.forEach(item => item['AccountURL'] = '/lightning/r/Account/' +item['Id'] +'/view');
        */
    @wire(fetchAccounts)
    wiredAccounts({data,error}){
        if(data){
            console.log('the data recrived is:',data)
            this.recivedData = data
            this.accList = data.map(item =>{
                return {...item,AccountUrl:'/'+item.Id}
            })
            console.log('the changed data',this.accList)
            this.accList = [...this.accList]

        }
        else{
            console.error(error)
        }
    }
    updateTable(eve){
        console.log('updateTable',eve.detail.records)
        this.miniAccountList = [...eve.detail.records]
        console.log('mini acc lst',this.miniAccountList)
    }

    //sorting 

    doSorting(event) {
       /* if(event.detail.fieldName == 'AccountUrl'){
            this.sortBy='Name'
        }
        else{
            this.sortBy = event.detail.fieldName;
        }*/

        //this.sortBy = event.detail.fieldName == 'AccountUrl' ?  this.sortBy='Name' : this.sortBy = event.detail.fieldName;
        
        console.log('sort field name',event.detail.fieldName);
        console.log('sort by',this.sortBy);
        this.sortBy = event.detail.fieldName
        this.sortDirection = event.detail.sortDirection;
        console.log('sort direction',this.sortDirection);
        this.sortData(this.sortBy, this.sortDirection);
    }

    sortData(fieldname, direction) {
        let parseData = JSON.parse(JSON.stringify(this.accList));
        //let parseData = this.miniAccountList;

       // console.log('parse data',this.parseData)
        // Return the value stored in the field
        fieldname= fieldname=='AccountUrl' ?  fieldname='Name' :fieldname= fieldname;
        
        let keyValue = (a) => {
            //console.log('a is:',a)
            return typeof a[fieldname] == 'string'? a[fieldname].toUpperCase() : a[fieldname];
        }
        // cheking reverse direction
        let isReverse = direction === 'asc' ? 1: -1;
        console.log('dir',isReverse)
        // sorting data
        parseData.sort((x, y) => {
            console.log(' before sort x:',x,'y is:',y)
            x = keyValue(x) ? keyValue(x) : ''; // handling null values
            y = keyValue(y) ? keyValue(y) : '';
            // sorting values based on direction
            console.log('After sort x:',x,'y is:',y)
            return isReverse * ((x > y) - (y > x));
        });
        console.log('before return parseData',parseData)
        this.accList = parseData;
    }    
}