public with sharing class AccountManager {
    public List<Contact> conList {get;set;}
    public string InputBox{get;set;}
    public list<Account> ListOfAccount{get;set;}
    public integer Accsize{get;set;}
    public string matchName;
    public string SelectedAccountId { get; set; }
    
    public AccountManager() {
       //load account data into our DataTable
       FetchAccountMethod();
   	}
    public AccountManager(ApexPages.StandardSetController controller) {

    }
    
    public PageReference ContactLists()
    {
    if(ApexPages.currentPage().getParameters().get('id') != null)
      conList = [Select id,Name,Phone,Email from contact where accountId =: ApexPages.currentPage().getParameters().get('id')];
     return null;
    }   
     
    public PageReference clearSearchBox() {
        inputBox = ' ';
        listOfAccount.clear();
        return null;
    }
    public void FetchAccountMethod(){
        matchName='%'+InputBox+'%';
        ListOfAccount=[select Id,Name,Type From Account Where Name Like:matchName];
        Accsize=ListOfAccount.size();
        
    }
    
    //For Delete Link
   
    public void DeleteAccount()
   {
      // if for any reason we are missing the reference 
      if (SelectedAccountId != null) {
      list<Account> Accst=[select Id from Account where Id=:SelectedAccountId];
          system.debug(Accst);
         delete Accst;
      }
     
      FetchAccountMethod();
   }    
    
    //Alphabetical search
    list<Account> ACL = [SELECT Name, Id, createdById, billingPostalCode, billingCountry, billingCity, billingstreet, Type, Website FROM Account]; 
    public list<String> alphabet{
        get{                                                                                                                    //To display a list of alphabets on vf page 
            alphabet = new list<string>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','Others','All'};
                return alphabet;         
        }
        set;
    }
    public String alphaSearchConct{get;set;}                                                             // To get commandlink parameter for alphabet selected
    public Pagereference getalphaSearch(){                                                              //To update contact list as per the alphabet selected by the user
        
        if (alphaSearchConct=='All'){
            ACL= [SELECT Name, Id, createdById, billingPostalCode, billingCountry, billingCity, billingstreet, Type, Website FROM Account];
        }
        else{
            ACL= [SELECT Name, Id, createdById, billingPostalCode, billingCountry, billingCity, billingstreet, Type, Website FROM Account WHERE Name Like:alphaSearchConct+'%'];
        }
        
        return null;
    }      
        
    public list<Account> getcontactList(){                               //to display records on vf page
        return (ACL);
    }

}