import os

import logging
import azure.functions as func
from azure.data.tables import TableClient


def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    connection_string = os.environ['connection_string']
    table_name = os.environ['table_name']
    table_client = TableClient.from_connection_string(connection_string, table_name)
    
    row_key = os.environ['row_key']
    partition_key = os.environ['partition_key']
    # Get entity
    entity = table_client.get_entity(row_key=row_key , partition_key=partition_key)
    counter_value = int(entity['counter_value']) + 1
    counter_value = str(counter_value)
    # Update entity
    entity['counter_value'] = counter_value
    table_client.update_entity(entity=entity)

    return func.HttpResponse(
        counter_value
    )
