import { LightningElement,api } from 'lwc';

export default class LabCreatForm extends LightningElement {
    @api invoke(){
        
    }
    dateVal
    handleDate(e){
        this.dateVal = e.detail.value
        console.log('date val',this.dateVal+2,e.target.value)
       let  dtTemp = new Date( this.dateVal)
       console.log(dtTemp)
       dtTemp = dtTemp.setDate(dtTemp.getDate()+2)
       console.log('updated date',dtTemp)

       
    }
}