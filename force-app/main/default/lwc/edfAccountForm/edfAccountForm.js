import { LightningElement ,api} from 'lwc';
import {createRecord} from 'lightning/uiRecordApi'
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
import ACCOUNT_OBJ from '@salesforce/schema/Account'
import NAME_FLD from '@salesforce/schema/Account.Name'
import COUNTRY_FLD from '@salesforce/schema/Account.BillingCountry'
import CITY_FLD from '@salesforce/schema/Account.BillingCity'
import ADDERSS_FLD from '@salesforce/schema/Account.BillingAddress'
import PHONE_FLD from '@salesforce/schema/Account.Phone'
import STATE_FLD from '@salesforce/schema/Account.BillingState'
import PIN_FLD from '@salesforce/schema/Account.BillingPostalCode'
import CONTACT_OBJ from '@salesforce/schema/Contact'
    import FNAME_FLD from '@salesforce/schema/Contact.FirstName'
    import LNAME_FLD from '@salesforce/schema/Contact.LastName'
    import EMAIL_FLD from '@salesforce/schema/Contact.Email'
    import ACCID_FLD from '@salesforce/schema/Contact.AccountId'
export default class EdfAccountForm extends LightningElement {
    emailData
    tempObj
    accId
    @api get emailAdress(){
        return this.emailData
    }
    set emailAdress(data){
        this.emailData = data
        console.log('thisemail',this.emailData)
    }
    get options() {
        return [
            { label: 'India', value: 'India' },
            { label: 'Russia', value: 'Russia' },
            { label: 'France', value: 'France' },
        ];
    }
    connectedCallback(){
         this.tempObj = {
            email :this.emailData,
            firstName :'',
            lastName:'',
            phone :'',
            country:'',
            postalCode:'',
            state:'',
            city:'',
            address1:'',
            address2:''
    
        }
    }
     
    handleForm(event){
        console.log('eve detail',event.target.name)
        console.log('eve target',event.target.value)
        const name = event.target.name
        const value = event.target.value
        console.log('val :',value,'name:',name)
        
        this.tempObj[name] = event.target.value
        //this.tempObj = {...this.tempObj,name:value}
        console.log('temp obj is ::' ,this.tempObj)
       // this.tempObj = event.target.name == 'firstName' ?{...this.tempObj,name:value}
    }
    handleSubmit(){
        const fields={}
        fields[ NAME_FLD.fieldApiName] = this.tempObj.lastName
        fields[ PHONE_FLD.fieldApiName] = this.tempObj.phone
        fields[ COUNTRY_FLD.fieldApiName] = this.tempObj.country
        fields[ CITY_FLD.fieldApiName] = this.tempObj.city
        //fields[ ADDERSS_FLD.fieldApiName] = this.tempObj.address1
        fields[ STATE_FLD.fieldApiName] = this.tempObj.state
        fields[ PIN_FLD.fieldApiName] = this.tempObj.postalCode
      let  recordInput ={apiName:ACCOUNT_OBJ.objectApiName,fields}
        createRecord(recordInput).then(result =>{
                                 this.accId = `${result.id}`
                                console.log('accid',this.accId)
                               
                           console.log('rcf:',result)
                            this.showToast('successfully Registered',`${result.fields.Name.value} account Registed `,'success')
                            
                        }).catch(error =>{
                            console.log('acc error',error)
                            this.showToast('Error Occured',error.body.message,'error')
                        })
        setTimeout(()=>{ 
            this.createContact()
        },5000);
    }
    showToast(title,message,variant){
        this.dispatchEvent(new ShowToastEvent({
            title,
            message,
            variant :variant || 'success'
        }))
    }
    createContact(){
        console.log('inside method:',this.accId)
        const fields={}
        fields[ FNAME_FLD.fieldApiName] = this.tempObj.firstName
        fields[ LNAME_FLD.fieldApiName] = this.tempObj.lastName
        fields[ EMAIL_FLD.fieldApiName] = this.emailData
        fields[ ACCID_FLD.fieldApiName] = this.accId
        console.log('fields val:', fields)
        let recordInput = {apiName :CONTACT_OBJ.objectApiName,fields}
        createRecord(recordInput).then(result =>{
                    console.log(result)
                  }).catch(error=>{
                    console.log('con error',error)
                    console.log(error.body.message)
                  })
    }
    
}
/*:{
                                                        NAME_FLD.fieldApiName : this.tempObj.lastName,
                                                        phone : this.tempObj.phone,
                                                        BillingAddress :this.tempObj.address1,
                                                        BillingPostalCode :this.tempObj.postalCode,
                                                        BillingState:this.tempObj.state,
                                                        BillingCountry:this.tempObj.country,
                                                        BillingCity:this.tempObj.city

                                                    }*/