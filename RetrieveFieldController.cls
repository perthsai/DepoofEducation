public with sharing  class RetrieveFieldsController { 
public List<String> objFields { get;set; }
public List<String> retrieveFields(String obj){
  // Object Name whose fields we have to retrieve
  String objectName =obj; 
  Map<String , Schema.SObjectType> schemaGlobalDescription = Schema.getGlobalDescribe();
   Schema.sObjectType objType = schemaGlobalDescription.get(objectName); 
   Schema.DescribeSObjectResult objDescribeSObjectResult = objType.getDescribe(); 
   Map<String , Schema.SObjectField> mapFieldList = objDescribeSObjectResult.fields.getMap();  
  for(Schema.SObjectField field : mapFieldList.values())  
  {  
    Schema.DescribeFieldResult fieldResult = field.getDescribe(); 
       System.debug('objFields--'+fieldResult);
 // isAccessible () Returns true if the current user can see this object, false otherwise
      if(fieldResult.isAccessible())
      objFields.add(fieldResult.getName());
      objFields.add(fieldResult.gettype());
      objFields.add(fieldResult.getlabel()); 
      objFields.add(fieldResult.getcustom());
   } 
   
  System.debug('objFields--'+objFields);
   return objFields;
 }
}  
