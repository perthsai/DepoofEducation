import { LightningElement,api,track,wire } from 'lwc';
import RetrieveFieldsController from '@salesforce/apex/RetrieveFieldsControlle.retrieveFields';
import {getObjectInfo} from 'lightning/uiObjectInfoApi';
   const columns= [{ label: 'Label', fieldName: 'label', type:text},
                      { label: 'API Name', fieldName: 'name', type: 'text' },
                    { label: 'Data Type', fieldName: 'type', type: 'phone' },
                     { label: 'Is Custom', fieldName: 'custom', type: 'text'}];

export default class TableView extends LightningElement {
    data =[];
    columns = columns;
    @wire(getObjectInfo, { objectApiName: '$objectName' }) 
    objectInfo({ error, data }){
        if(data){
            RetrieveFieldsController({obj :data.label}).then(result=>{
                if(result){
                    this.data=result;
                }
            }).catch(error=>{console.log(error);}) 
        }
    };
    
}