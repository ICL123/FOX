public class NewCaseListController {
    public List<Case> getNewCases() {
        List<Case> filterList=[SELECT Id,CaseNumber FROM Case];
        return filterList;
    }
}