@isTest
private class MovieServiceTest {

    @testSetup
    static void setup() {
        Genre__c genre = TestDataFactory.createGenre(true);
        TestDataFactory.createMovie(genre.Id, true);
    }

    @isTest
    static void testGetAllMovies() {
        List<Movie__c> movies = MovieService.getAllMovies();
        System.assert(movies.size() > 0, 'Movie list should not be empty');
    }

    @isTest
    static void testGetAllMoviesReturnsCorrectName() {
        List<Movie__c> movies = MovieService.getAllMovies();
        System.assertEquals('Test Movie', movies[0].Name, 'Movie name should match');
    }

    @isTest
    static void testNoMoviesReturnsEmptyList() {
        delete [SELECT Id FROM Movie__c];
        List<Movie__c> movies = MovieService.getAllMovies();
        System.assertEquals(0, movies.size(), 'Should return empty list');
    }

    @isTest
    static void testCreateMovie() {
        Genre__c genre = [SELECT Id FROM Genre__c LIMIT 1];
        Movie__c m = TestDataFactory.createMovie(genre.Id, false);
        Movie__c result = MovieService.createMovie(m);
        System.assertNotEquals(null, result.Id, 'Movie should have an Id after insert');
    }

    @isTest
    static void testUpdateMovie() {
        Movie__c m = [SELECT Id, Name FROM Movie__c LIMIT 1];
        m.Name = 'Updated Movie';
        MovieService.updateMovie(m);
        Movie__c updated = [SELECT Name FROM Movie__c WHERE Id = :m.Id];
        System.assertEquals('Updated Movie', updated.Name, 'Name should be updated');
    }

    @isTest
    static void testDeleteMovie() {
        Movie__c m = [SELECT Id FROM Movie__c LIMIT 1];
        MovieService.deleteMovie(m.Id);
        List<Movie__c> result = [SELECT Id FROM Movie__c WHERE Id = :m.Id];
        System.assertEquals(0, result.size(), 'Movie should be deleted');
    }

    @isTest
    static void testSetDefaultStatus() {
        Genre__c genre = [SELECT Id FROM Genre__c LIMIT 1];
        Movie__c m = TestDataFactory.createMovie(genre.Id, false);
        m.Status__c = null;
        insert m;
        Movie__c inserted = [SELECT Status__c FROM Movie__c WHERE Id = :m.Id];
        System.assertEquals('New', inserted.Status__c, 'Status should default to New');
    }

    @isTest
    static void testCalculatePopularity() {
        Movie__c m = [SELECT Id FROM Movie__c LIMIT 1];
        m.Average__c = 4.5;
        MovieService.updateMovie(m);
        Movie__c updated = [SELECT Popularity_Score__c FROM Movie__c WHERE Id = :m.Id];
        System.assertNotEquals(null, updated.Popularity_Score__c, 'Popularity score should be calculated');
    }
}