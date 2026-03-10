@isTest
private class MovieServiceTest {

    @isTest
    static void testCreateMovie(){

        Movie__c m = new Movie__c(
            Name = 'Interstellar',
            Genre__c = 'Sci-Fi'
        );

        insert m;

        List<Movie__c> movies = MovieService.getAllMovies();

        System.assert(
            movies.size() > 0,
            'Movie list should contain at least one movie after insertion'
        );
    }

}