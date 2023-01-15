import { LightningElement } from 'lwc';
import edfHeaderLogo from '@salesforce/resourceUrl/edfLogo'
import edfBackgorundUrl from '@salesforce/resourceUrl/edfBackground'

export default class EdfCommunityMain extends LightningElement {
    headerLogoUrl =edfHeaderLogo
    get backGround(){
        return `height:50rem;background-image:url(${edfBackgorundUrl})`
    }
}