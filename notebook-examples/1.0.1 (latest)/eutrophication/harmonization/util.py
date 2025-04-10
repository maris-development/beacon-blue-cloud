def coalesce_columns(columns: list[str], alias) -> dict:
    return {"function": "coalesce", "args": columns, "alias": alias}


def function_call(function: str, columns: list[str], alias: str = None) -> dict:
    return {"function": function, "args": columns, "alias": alias}


def value(value, alias: str = None) -> dict:
    return {"value": value, "alias": alias}


def column(column: str, alias: str = None) -> dict:
    return {"column": column, "alias": alias}
