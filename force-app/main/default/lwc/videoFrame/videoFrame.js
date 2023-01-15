import { LightningElement ,wire} from 'lwc';
import getDriveVedioUrls from '@salesforce/apex/contentDocmt.getDrivefilesUrl'
export default class VideoFrame extends LightningElement {
    currentVedioUrl
    urlArray
    currentPos = 0
    @wire(getDriveVedioUrls)
    wiredUrl({data,error}){
        if(data){
            console.log('data is ::',data)
            this.urlArray =data;
            this.currentVedioUrl=this.urlArray[0]
        }
        if(error){
            console.error(error)
        }
    }
    handlePrevious(){
        if(this.currentPos > 0){
            this.currentPos --
            this.currentVedioUrl =this.urlArray[this.currentPos] 
        }
    }
    handleNext(){
        if(this.currentPos <this.urlArray.length-1){
            this.currentPos ++
            this.currentVedioUrl =this.urlArray[this.currentPos] 
        }
    }
}