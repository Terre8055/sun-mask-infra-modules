import os
# from slack_url import shorten
from slack_sdk import WebClient
from slack_sdk.errors import SlackApiError
import logging


logging.basicConfig(level=logging.DEBUG)
# Initialize the Slack client
# Initialize the Slack client
slack_token = os.getenv("SLACK_TOKEN")
if not slack_token:
    raise ValueError("SLACK_TOKEN environment variable is not set")
client = WebClient(token=slack_token)

# presigned_url = os.environ["PRESIGNED_URL"]
base_infra_cost = f'infracost-base.txt'
new_infra_cost_after = f'infracost.txt'

# shorten_presign_url = shorten(presigned_url)
try:
    # Upload summary report
    with open(base_infra_cost, "r") as file1:
        file_content = file1.read()
    
    base_infra_cost_file = client.files_upload_v2(
        title="Base Infra Cost Report",
        filename=base_infra_cost,
        content=file_content,
    )
    
    base = base_infra_cost_file.get("file").get("permalink")
    
    new_message = client.chat_postMessage(
        channel="C076CEFAXJ5",
        text=f"Baseline Infra Cost Breakdown for Infra  {base}.",
    )
    print("Summary report uploaded and message sent successfully!")

    # Upload detailed report
    with open(new_infra_cost_after, "r") as file2:
        detailed_file_content = file2.read()

    new_infra_cost_after_file = client.files_upload_v2(
        title="New Change Infra Cost Report",
        filename=new_infra_cost_after,
        content=detailed_file_content,
    )
    
    new_chage = new_infra_cost_after_file.get("file").get("permalink")

    new_message = client.chat_postMessage(
        channel="C076CEFAXJ5",
        text=f"Change Infra Cost Breakdown  {new_chage}.",
    )
    print("Detailed report uploaded and message sent successfully!")

except FileNotFoundError as e:
    print(f"Error: {e.filename} not found.")
except SlackApiError as e:
    print(f"Error uploading file or sending message to Slack: {e.response['error']}")
except Exception as e:
    print(f"An error occur: {str(e)}")