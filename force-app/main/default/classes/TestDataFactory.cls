@isTest
public class TestDataFactory {

    public static Genre__c createGenre(Boolean doInsert) {
        Genre__c g = new Genre__c(
            Name = 'Action',
            Genre_Code__c = 'ACT',
            Is_Active__c = true
        );
        if (doInsert) {
            insert g;
        }
        return g;
    }

    public static Actor__c createActor(Boolean doInsert) {
        Actor__c a = new Actor__c(
            Name = 'Test Actor',
            Nationality__c = 'Indian',
            Is_Active__c = true
        );
        if (doInsert) {
            insert a;
        }
        return a;
    }

    public static Movie__c createMovie(Id genreId, Boolean doInsert) {
        Actor__c actor = createActor(true);
        Movie__c m = new Movie__c(
            Name = 'Test Movie',
            Genre__c = genreId,
            Actor__c = actor.Id,
            Release_Date__c = Date.today().addDays(-10),
            Duration_Minutes__c = 120,
            Status__c = 'New',
            Language__c = 'English'
        );
        if (doInsert) {
            insert m;
        }
        return m;
    }

    public static Subscriber__c createSubscriber(Boolean doInsert) {
        Subscriber__c s = new Subscriber__c(
            Name = 'Test User',
            Email__c = 'test@cinesphere.com',
            Subscription_Plan__c = 'Free',
            Status__c = 'Active',
            Subscription_Start_Date__c = Date.today(),
            Subscription_End_Date__c = Date.today().addYears(1)
        );
        if (doInsert) {
            insert s;
        }
        return s;
    }

    public static Review__c createReview(Id movieId, Id subscriberId, Boolean doInsert) {
        Review__c r = new Review__c(
            Movie__c = movieId,
            Subscriber__c = subscriberId,
            Rating__c = 4,
            Review_Comment__c = 'Great movie',
            Review_Date__c = DateTime.now()
        );
        if (doInsert) {
            insert r;
        }
        return r;
    }

    public static Watchlist__c createWatchlist(Id movieId, Id subscriberId, Boolean doInsert) {
        Watchlist__c w = new Watchlist__c(
            Movie__c = movieId,
            Subscriber__c = subscriberId,
            Status__c = 'Watching',
            Added_Date__c = Date.today()
        );
        if (doInsert) {
            insert w;
        }
        return w;
    }
}