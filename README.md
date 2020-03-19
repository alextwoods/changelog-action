# changelog-action

## Testing locally
Build the image `docker image build ./ -t changelog_action`

You need the sdk checked out locally (Replace FUL_PATH_TO_SDK)
`docker run --name changelog_action --workdir /github/workspace -v "FUL_PATH_TO_SDK/aws-sdk-ruby":"/github/workspace" changelog_action`
