trigger MovieTrigger on Movie__c (before insert, before update) {
    new MovieTriggerHandler().run();
}