public class MovieTriggerHandler extends TriggerHandler {

    protected override void beforeInsert() {
        MovieService.setDefaults(Trigger.new);
    }

    protected override void beforeUpdate() {
        MovieService.calculatePopularity(Trigger.new);
    }
}