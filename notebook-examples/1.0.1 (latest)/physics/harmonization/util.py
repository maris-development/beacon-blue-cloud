def coalesce_columns(columns: list[str], alias) -> dict:
    return {"function": "coalesce", "args": columns, "alias": alias}


def function_call(function: str, columns: list[str], alias: str = None, try_cast = None) -> dict:
    if try_cast: 
        return {"function": function, "args": columns, "alias": alias, "try_cast": try_cast}
    else:
        return {"function": function, "args": columns, "alias": alias}
    

def value(value, alias: str = None) -> dict:
    return {"value": value, "alias": alias}


def column(column: str, alias: str = None, try_cast= None) -> dict:
    if try_cast:
        return {"column": column, "alias": alias, "try_cast": try_cast}
    else: 
        return {"column": column, "alias": alias}
