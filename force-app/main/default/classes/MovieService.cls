public with sharing class MovieService {

    public static List<Movie__c> getAllMovies() {

        if(!Schema.sObjectType.Movie__c.isAccessible()){
            throw new AuraHandledException('User does not have access to Movie object');
        }

        return [
            SELECT Id, Name, Genre__c, Release_Date__c, Popularity_Score__c
            FROM Movie__c
            ORDER BY Popularity_Score__c DESC
        ];
    }

    public static Movie__c createMovie(Movie__c movieRecord){

        if(!Schema.sObjectType.Movie__c.isCreateable()){
            throw new AuraHandledException('User does not have permission to create Movie');
        }

        insert movieRecord;
        return movieRecord;
    }

}