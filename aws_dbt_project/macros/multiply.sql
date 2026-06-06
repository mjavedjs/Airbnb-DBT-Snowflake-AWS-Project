{% macro multiply(x, y, PRECISION) %}
  round({{ x }} * {{ y }}, {{ PRECISION }})   
{% endmacro %}