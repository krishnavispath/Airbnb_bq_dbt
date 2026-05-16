{% macro pre_hook_audit() %}

    INSERT INTO {{ target.schema }}.audit_log
    (
        event_time,
        event_name,
        model_name,
        status
    )

    VALUES
    (
        CURRENT_TIMESTAMP(),
        'MODEL_START',
        '{{ this.name }}',
        'STARTED'
    )

{% endmacro %}