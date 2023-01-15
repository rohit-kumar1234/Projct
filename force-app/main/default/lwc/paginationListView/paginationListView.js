import { LightningElement ,api} from 'lwc';

export default class PaginationListView extends LightningElement {
    currentPage =1
    noOfPages
    @api size
    allRecords
    displayRecords
    get rcds(){
        return this.displayRecords
    }
    @api
    set rcds(data){
        if(data){
            console.log('child data:',data)
            this.allRecords = data
            console.log('all records',this.allRecords)
            this.noOfPages =Math.ceil(data.length/this.size)
            
            this.listViewData()
        }
    }
    handlePrevious(){
        if(this.currentPage > 1){
            this.currentPage--
            this.listViewData()
        }
    }
    get previousDisable(){
        return this.currentPage <=1 
    }
    handleNext(){
        if(this.currentPage < this.noOfPages){
            ++this.currentPage
            this.listViewData()
        }
    }
    get disableNext(){
        return this.currentPage >= this.noOfPages
    }
    listViewData(){
        const start= (this.currentPage - 1)*this.size
        const end = this.currentPage*this.size
        this.displayRecords = this.allRecords.slice(start,end)
            console.log('display records',this.displayRecords)
        this.dispatchEvent(new CustomEvent('updated',{
            detail:{
                records:JSON.parse(JSON.stringify(this.displayRecords))
            }
        }))
    }
}