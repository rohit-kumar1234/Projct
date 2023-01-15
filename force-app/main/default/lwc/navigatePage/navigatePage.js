import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class NavigatePage extends NavigationMixin(LightningElement) {

    handleClick(){
        this[NavigationMixin.Navigate]({
            type : 'standard__recordPage',
            attributes : {
                recordId :'01Z5j000000lKDDEA2',
                objectApiName :'Dashboard',
                actionName: 'view'
            }
        })
    }
}