import { LightningElement } from 'lwc';
export default class EdfBody extends LightningElement {
   
   
    bodyFooTxt = `Don’t have an account?`
    emailVal
    displayMain =true
    openPopUp = false
    openForm
    emailRegister
    handleRegister(){
        this.displayMain = false
        this.emailRegister =true
    }
    handleBack(){
        this.emailRegister=false
        this.displayMain = true
    }
    handleSubmit(){
        this.openPopUp=true
    }
    modalClose(){
        this.openPopUp=false
        //this.dispatchEvent(new CustomEvent('close'))
    }
    registerhandle(){
        this.openPopUp=false
        this.emailRegister =false
        this.displayMain=false
        this.openForm=true
    }
    handleEmail(eve){
        this.emailVal = eve.detail.value
    }
}