public class ContactListViewController {
public ContactlistViewController(){
    RecordsPerPageslist=10;
}
list<contact> con = [SELECT Name,Account.name,Title,Phone,Email FROM Contact]; 
public list<String> alphabet{
    get{                                                                                                                    //To display a list of alphabets on vf page 
        alphabet = new list<string>{'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','Others','All'};
            return alphabet;         
            }
    set;
}
public String alphaSearchConct{get;set;}                                                    // To get commandlink parameter for alphabet selected
public Pagereference getalphaSearch(){                                                              //To update contact list as per the alphabet selected by the user

    if (alphaSearchConct=='All'){
        con = [SELECT name,Account.name,Title,Phone,Email FROM contact];
    }
    else{
       	con = [SELECT name,Account.name,Title,Phone,Email FROM contact WHERE lastName Like:alphaSearchConct+'%' or firstName Like:alphaSearchConct+'%'];
    }
    ApexPages.StandardSetController ssc = new ApexPages.StandardSetController(con);
    stdSetController= ssc;
    return null;
}      
public Integer PageNumber{
    get{                                                            //To get current page number
        this.PageNumber=stdSetController.getPageNumber();
        return this.PageNumber;
    }
    set{                                                              // To navigate to the page number entered by the user
        stdSetController.setPageNumber(value);
    }
}
public Integer TotalPages{                                            // Total number of pages as per user selection of Records per page
    get{
          if(stdSetController.getResultSize() <=10)
              this.TotalPages=1;
        if(Math.Mod(stdSetController.getResultSize() ,stdSetController.getPageSize()) == 0)
            this.TotalPages =(stdSetController.getResultSize()/stdSetController.getPageSize());
        else
            this.TotalPages = (stdSetController.getResultSize()/stdSetController.getPageSize())+1;
        System.Debug(this.TotalPages);
        return totalpages;
    }
    set;
}
public Integer MaxNumberOfRecords{                                    //Maximum number of records in a query list
    get{
             return stdSetController.getRecords().size();
    }
    set;
}
public list<SelectOption> getRecordsPerPageOptionList(){              //To display a drop down list on vf page  
        list<SelectOption>  options = new list<SelectOption>();
        options.add(new selectOption('10','10'));
        options.add(new selectOption('25','25'));
        options.add(new selectOption('50','50'));
        options.add(new selectOption('100','100'));
        options.add(new selectOption('200','200'));
        return options;
}
public Integer RecordsPerPageslist{ 
    get;set{                                                          //To select number of records per page
       // System.debug(value);
        if(value!=null){
            this.RecordsPerPagesList=value;
        }
       // else
          // this.RecordsPerPageslist=10;
    }       
}
public void next(){
    this.stdSetController.next();
}
public ApexPages.StandardSetController stdSetController{            //Instantiating a standard set controller
    get{
        if(stdSetController==null){
             stdSetController = new ApexPages.StandardSetController(con);
        }
          stdSetController.setPageSize(RecordsPerPageslist);        //Limiting Number of records to be displayed per page 
           return stdSetController;   
    }
    set;
}
public list<contact> getcontactList(){                               //to display records on vf page
   return (list<contact>)stdSetController.getRecords();
}
}