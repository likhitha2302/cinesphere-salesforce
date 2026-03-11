@isTest
private class MovieServiceTest {

    @isTest
    static void testCreateMovie() {
        Genre__c genre = TestDataFactory.createGenre(true);
        Movie__c movie = TestDataFactory.createMovie(genre.Id, true);

        List<Movie__c> movies = MovieService.getAllMovies();

        System.assert(
            movies.size() > 0,
            'Movie list should contain at least one movie after insertion'
        );
    }

    @isTest
    static void testGetAllMoviesReturnsCorrectName() {
        Genre__c genre = TestDataFactory.createGenre(true);
        Movie__c movie = TestDataFactory.createMovie(genre.Id, true);

        List<Movie__c> movies = MovieService.getAllMovies();

        System.assertEquals(
            'Test Movie',
            movies[0].Name,
            'Movie name should match what was inserted'
        );
    }

    @isTest
    static void testNoMoviesReturnsEmptyList() {
        List<Movie__c> movies = MovieService.getAllMovies();

        System.assertEquals(
            0,
            movies.size(),
            'Should return empty list when no movies exist'
        );
    }
}
