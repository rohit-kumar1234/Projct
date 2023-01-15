import { LightningElement,api } from 'lwc';
import attatchPdf from '@salesforce/apex/pdfGenHandler.attatchPdf'
export default class LgtRcdEditForm extends LightningElement {
    @api objectApiName;
    productValue
    //closeDateValue 
    probabilityValue
    oppId
    flag = false


    /*
    someDate = new Date(new Date().getTime()+(90*24*60*60*1000)); //added 90 days to todays date
                return someDate.toISOString();
     */
    handleproduct(eve){
        this.productValue=eve.detail.value
    }/*
    handleCloseDate(eve){
        console.log('inside closedate :::' ,eve.detail.value)
       // this.closeDateValue=new Date(new Date().getTime()+(2*24*60*60*1000)).toISOString();
       // console.log('after chanfe::' ,this.closeDateValue)
        this.closeDateValue=new Date(new Date().getDate()+3).toISOString();
        console.log('after chanfe::' ,this.closeDateValue)
    } */
    handleProbability(event){
       // this.probabilityValue=event.detail.value
        if(event.detail.value == 75){
            this.flag = true
        }
        else{
            this.flag = false
        }

    }
    handleForm(eve){
        this.oppId=eve.detail.id
        console.log('before call method')
            //console.log('tis opp id',this.oppId)
            attatchPdf({oppRecId : this.oppId}).then(result =>{
                console.log(result);
            }).catch(error =>{
                console.log(error);
            })
        //const fields = eve.detail.fields;
//console.log('fieldvalues' ,JSON.parse(JSON.stringify(fields)))
       
    }
    handleSave(eve){
        setTimeout(() => {
            this.template.querySelector('c-opp-line-item').handleCreateRecord()
            
           
        }, 5000);
       
    }
}