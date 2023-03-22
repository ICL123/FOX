public with sharing class EscalationDeskCaseRestriction {
    public void checkToAndFromAddresses(List<EmailMessage> emailMessageList){

        system.debug('Inside checkToAndFromAddresses--------------------------------->');
        system.debug('emailMessageList-------------------------------->'+emailMessageList);
        system.debug('Custom label------->'+system.label.Domain_Sodexo);
        List<string> fromEmailAddress=new List<string>();
        List<id> CaseID=new List<id>();
        string domainName=System.label.Domain_Sodexo;
        Group queObj=[select id,Name,Email from Group where DeveloperName='Escalation_Desk'];
        //if other domain and escaltion desk mail case creation false

        //string escalationDeskEmail=system.label.escalation_Desk_Email;
        //system.debug('escalationDeskEmail------------------>'+escalationDeskEmail);
        system.debug('domainName---------->'+domainName);
        //1.for on list of email messages 
        //2.To address and from address cha domain 
        for (EmailMessage emMes:emailMessageList){
            system.debug('from Address----------------------------------->' +emMes.FromAddress);
            system.debug('ToAddress-------------------------------------->' +emMes.ToAddress);
           //list<string> toAddressSplit=splitToAddress(emMes.ToAddress);
            //System.debug('toAddressSplit------------------------------------>'+toAddressSplit);
            if(!emMes.FromAddress.contains(domainName) && emMes.ToAddress.contains(queObj.email)){
                system.debug('To Address-Case not registered');
                emMes.addError('Case not registered');
                CaseID.add(emMes.RelatedToID);
                fromEmailAddress.add(emMes.FromAddress);
            }
            if(emMes.CcAddress!=null){
                if(!emMes.FromAddress.contains(domainName) && emMes.CcAddress.contains(queObj.email)){
                
                    system.debug('CC Address-Case not registered');
                    emMes.addError('Case not registered');
                    CaseID.add(emMes.RelatedToID);
                    fromEmailAddress.add(emMes.FromAddress);
                }
            } 
        }
        if(fromEmailAddress.size()>0){
            //sendEmailAboutRestriction(fromEmailAddress);   
        }
        list<Case> delCaseList=[select id from case where ID =:CaseID];
        System.debug('delCaseList----------------->'+delCaseList);
       /* if(delCaseList.size()>0){
            delete delCaseList;
        }*/
    }
    /*public static void sendEmailAboutRestriction(List<string> fromEmailAddress){
        system.debug('Inside sendEmailAboutRestriction---------------------------->');
        system.debug('fromEmailAddress--------------------------->'+fromEmailAddress);
        //String TemplateName=system.label.Email_Template_For_Case_Restriction;
        system.debug('TemplateName--------------------->'+TemplateName);

        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        OrgWideEmailAddress owea = [SELECT Id, Address, DisplayName FROM OrgWideEmailAddress WHERE DisplayName='Auto Reply' LIMIT 1];
        
        system.debug('OrgWideEmailAddress---------------->'+owea);
        Contact conList=[select id,name from contact where name='testing testing' LIMIT 1];
        //EmailTemplate templateId=[select id,Name from EmailTemplate where name=:TemplateName];
        system.debug('templateId--------------------->'+templateId);

        
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setOrgWideEmailAddressId(owea.ID);
            mail.setTemplateId(templateId.Id);
            mail.setTargetObjectId(conList.Id);
            mail.setTreatTargetObjectAsRecipient(false); 
            mail.setSaveAsActivity(false);       
            mail.setToAddresses(fromEmailAddress);
            emailList.add(mail);
        
         system.debug('emailList---------------------------->'+emailList);   

        if(!emailList.isEmpty()){ 
            Messaging.SendEmailResult [] r = Messaging.sendEmail(emailList, false);
            if(r[0].isSuccess()){
                system.debug('This Email Has sucessfully sent to recepient');
            }
            System.debug('Email Sent !!');
            System.debug('RM Email SendEmailResult [] r >> ' +r);
        }    
    }*/
    
}