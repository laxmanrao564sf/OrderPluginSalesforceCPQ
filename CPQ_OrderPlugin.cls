/** Description: Order Management Plugin used in Salesforce CPQ to set Order start date.*/
global class CPQ_OrderPlugin implements SBQQ.OrderManagementPlugin {
    public Date getOrderStartDate(Id quoteId){
        Date orderStartDate;
        
        //Query for Quote that matches provided record ID
        SBQQ__Quote__c quote = [SELECT Order_Start_Date__c FROM SBQQ__Quote__c WHERE Id=:quoteId];
        if(quote.Order_Start_Date__c == null){
            orderStartDate = system.today();
        }
        else{
            orderStartDate = quote.Order_Start_Date__c;
            system.debug('Populating Start Date on Order from Plugin');
        }
        return (orderStartDate);
    }
}