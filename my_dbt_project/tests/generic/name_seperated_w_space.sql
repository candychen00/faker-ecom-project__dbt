{% test name_seperated_w_space(model, column_name) %}

    select *
    from {{ model }}
    where ARRAY_LENGTH(SPLIT( {{column_name}} , ' ')) != 2

{% endtest %}