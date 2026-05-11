{% macro log_audit_results(results) %}

    {% for result in results %}

        {% set model_name = result.node.name %}

        {% if result.status == 'success' %}
            {% set run_status = 'SUCCESS' %}
        {% else %}
            {% set run_status = 'FAILURE' %}
        {% endif %}

        {% set query %}
            INSERT INTO {{ target.schema }}.audit_log
            (event_time, event_name, model_name, status)

            VALUES
            (
                CURRENT_TIMESTAMP(),
                'DBT_RUN',
                '{{ model_name }}',
                '{{ run_status }}'
            )
        {% endset %}

        {% do run_query(query) %}

    {% endfor %}

{% endmacro %}