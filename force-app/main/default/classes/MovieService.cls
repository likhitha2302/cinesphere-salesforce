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

    public static void setDefaults(List<Movie__c> movies) {
        for (Movie__c m : movies) {
            if (String.isBlank(m.Status__c)) {
                m.Status__c = 'New';
            }
        }
    }

    public static void calculatePopularity(List<Movie__c> movies) {
        for (Movie__c m : movies) {
            Decimal score = 0;

            if (m.Average__c != null) {
                score += (m.Average__c / 5) * 60;
            }

            if (m.Release_Date__c != null) {
                Integer daysSince = m.Release_Date__c.daysBetween(Date.today());
                if (daysSince <= 30) {
                    score += 40;
                } else if (daysSince <= 180) {
                    score += 25;
                } else if (daysSince <= 365) {
                    score += 15;
                } else {
                    score += 5;
                }
            }

            m.Popularity_Score__c = score.setScale(2);
        }
    }
     

    public static Movie__c updateMovie(Movie__c movie) {
        if (!Schema.sObjectType.Movie__c.isUpdateable()) {
            throw new AuraHandledException('No permission to update Movie');
        }
        update movie;
        return movie;
    }

    public static void deleteMovie(Id movieId) {
        if (!Schema.sObjectType.Movie__c.isDeletable()) {
            throw new AuraHandledException('No permission to delete Movie');
        }
        delete [SELECT Id FROM Movie__c WHERE Id = :movieId];
    }

}