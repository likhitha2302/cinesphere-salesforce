public abstract class TriggerHandler {

    public void run() {
        if (Trigger.isBefore) {
            if (Trigger.isInsert) {
                beforeInsert();
            }
            if (Trigger.isUpdate) {
                beforeUpdate();
            }
            if (Trigger.isDelete) {
                beforeDelete();
            }
        }
        if (Trigger.isAfter) {
            if (Trigger.isInsert) {
                afterInsert();
            }
            if (Trigger.isUpdate) {
                afterUpdate();
            }
            if (Trigger.isDelete) {
                afterDelete();
            }
        }
    }

    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected virtual void beforeInsert() {}

    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected virtual void beforeUpdate() {}

    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected virtual void beforeDelete() {}

    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected virtual void afterInsert() {}

    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected virtual void afterUpdate() {}

    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected virtual void afterDelete() {}
}