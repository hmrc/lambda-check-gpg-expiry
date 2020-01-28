import logging

logger = logging.getLogger('check-gpg-expiry')
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    return 'Hello World'
