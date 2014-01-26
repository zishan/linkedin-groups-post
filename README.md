## STEP 1: API KEYS
Create a [new application](https://www.linkedin.com/secure/developer?newapp=) on LinkedIn Developer.
 
  * make sure "Live Status" is "Development"
  * make sure "OAuth User Agreement" -> "Default Scope" includes "rw_groups"

Make note of the following:

  * API Key
  * Secret Key
  * OAuth User Token
  * OAuth User Secret

## STEP 2: Group IDs
In order to proceed, you'll need to determine the id for every group you wish to post to.

Generally, you can visit the group itself and look for "gid=xxx" in the URL.

See [this](http://developer.linkedin.com/forum/find-group-id) or [this](http://developer.linkedin.com/forum/how-get-group-id-profiles-0) for relevant discussion.

## STEP 3: Discussion POST Data
The POST body is pretty straightforward. Generally, you'll want to create something similar with a "content" element to share a URL. See the [Developer API Docs](http://developer.linkedin.com/documents/groups-api#create) for example output.

```
post = {
  'title' => 'New Group Discussion',
  'summary' => 'What does everyone think about platform development?',
  'content' => {
    'submitted-url' => 'http://developer.linkedin.com/forum',
    'submitted-image-url' => 'http:/www.example.com/linkedin.png',
    'title' => 'Build the Professional Web with LinkedIn',
    'description' => 'A great resource for finding documentation and answers related to developing on the LinkedIn Platform'
  }
}
```

## STEP 4: Modify ruby-example.rb
1. set `api_key=`, `api_secret=`, `user_token=` and `user_secret=` with your application keys from step 1
2. populate `gids = []` with your group ids from step 2
3. populate `post = {}` with your post DATA from step 3
4. run the script

You are now free to move about the cabin.
