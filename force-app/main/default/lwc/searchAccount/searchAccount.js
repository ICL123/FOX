import { LightningElement ,wire, track } from 'lwc';
import getAccount from '@salesforce/apex/SearchAccount.getAccount';
const DELAY = 500;
export default class SearchAccount extends LightningElement {
    accountName = '';
    @track accountList = [];
    @wire(getAccount, {searchKey:'$accountName'})
    
    retrieveAccounts({error, data}) {
        if(data) {
            this.accountList = data;
        }
        else {

        }
    }

    handleKeyChange(event) {
        const searchString = event.target.value;
        window.clearTimeout(this.delayTimeout);
        this.delayTimeout = setTimeout(()=>{
            this.accountName = searchString;
        }, DELAY);
    }
}