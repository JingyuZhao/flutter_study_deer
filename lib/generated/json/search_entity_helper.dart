import 'package:flutter_study/pages/order/models/search_entity.dart';

searchEntityFromJson(SearchEntity data, Map<String, dynamic> json) {
  if (json['total_count'] != null) {
    data.totalCount = json['total_count']?.toInt();
  }
  if (json['incomplete_results'] != null) {
    data.incompleteResults = json['incomplete_results'];
  }
  if (json['items'] != null) {
    data.items = new List<SearchItem>();
    (json['items'] as List).forEach((v) {
      data.items.add(new SearchItem().fromJson(v));
    });
  }
  return data;
}

Map<String, dynamic> searchEntityToJson(SearchEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['total_count'] = entity.totalCount;
  data['incomplete_results'] = entity.incompleteResults;
  if (entity.items != null) {
    data['items'] = entity.items.map((v) => v.toJson()).toList();
  }
  return data;
}

searchItemFromJson(SearchItem data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id']?.toInt();
  }
  if (json['node_id'] != null) {
    data.nodeId = json['node_id']?.toString();
  }
  if (json['name'] != null) {
    data.name = json['name']?.toString();
  }
  if (json['full_name'] != null) {
    data.fullName = json['full_name']?.toString();
  }
  if (json['private'] != null) {
    data.private = json['private'];
  }
  if (json['html_url'] != null) {
    data.htmlUrl = json['html_url']?.toString();
  }
  if (json['description'] != null) {
    data.description = json['description']?.toString();
  }
  if (json['fork'] != null) {
    data.fork = json['fork'];
  }
  if (json['url'] != null) {
    data.url = json['url']?.toString();
  }
  if (json['forks_url'] != null) {
    data.forksUrl = json['forks_url']?.toString();
  }
  if (json['keys_url'] != null) {
    data.keysUrl = json['keys_url']?.toString();
  }
  if (json['collaborators_url'] != null) {
    data.collaboratorsUrl = json['collaborators_url']?.toString();
  }
  if (json['teams_url'] != null) {
    data.teamsUrl = json['teams_url']?.toString();
  }
  if (json['hooks_url'] != null) {
    data.hooksUrl = json['hooks_url']?.toString();
  }
  if (json['issue_events_url'] != null) {
    data.issueEventsUrl = json['issue_events_url']?.toString();
  }
  if (json['events_url'] != null) {
    data.eventsUrl = json['events_url']?.toString();
  }
  if (json['assignees_url'] != null) {
    data.assigneesUrl = json['assignees_url']?.toString();
  }
  if (json['branches_url'] != null) {
    data.branchesUrl = json['branches_url']?.toString();
  }
  if (json['tags_url'] != null) {
    data.tagsUrl = json['tags_url']?.toString();
  }
  if (json['blobs_url'] != null) {
    data.blobsUrl = json['blobs_url']?.toString();
  }
  if (json['git_tags_url'] != null) {
    data.gitTagsUrl = json['git_tags_url']?.toString();
  }
  if (json['git_refs_url'] != null) {
    data.gitRefsUrl = json['git_refs_url']?.toString();
  }
  if (json['trees_url'] != null) {
    data.treesUrl = json['trees_url']?.toString();
  }
  if (json['statuses_url'] != null) {
    data.statusesUrl = json['statuses_url']?.toString();
  }
  if (json['languages_url'] != null) {
    data.languagesUrl = json['languages_url']?.toString();
  }
  if (json['stargazers_url'] != null) {
    data.stargazersUrl = json['stargazers_url']?.toString();
  }
  if (json['contributors_url'] != null) {
    data.contributorsUrl = json['contributors_url']?.toString();
  }
  if (json['subscribers_url'] != null) {
    data.subscribersUrl = json['subscribers_url']?.toString();
  }
  if (json['subscription_url'] != null) {
    data.subscriptionUrl = json['subscription_url']?.toString();
  }
  if (json['commits_url'] != null) {
    data.commitsUrl = json['commits_url']?.toString();
  }
  if (json['git_commits_url'] != null) {
    data.gitCommitsUrl = json['git_commits_url']?.toString();
  }
  if (json['comments_url'] != null) {
    data.commentsUrl = json['comments_url']?.toString();
  }
  if (json['issue_comment_url'] != null) {
    data.issueCommentUrl = json['issue_comment_url']?.toString();
  }
  if (json['contents_url'] != null) {
    data.contentsUrl = json['contents_url']?.toString();
  }
  if (json['compare_url'] != null) {
    data.compareUrl = json['compare_url']?.toString();
  }
  if (json['merges_url'] != null) {
    data.mergesUrl = json['merges_url']?.toString();
  }
  if (json['archive_url'] != null) {
    data.archiveUrl = json['archive_url']?.toString();
  }
  if (json['downloads_url'] != null) {
    data.downloadsUrl = json['downloads_url']?.toString();
  }
  if (json['issues_url'] != null) {
    data.issuesUrl = json['issues_url']?.toString();
  }
  if (json['pulls_url'] != null) {
    data.pullsUrl = json['pulls_url']?.toString();
  }
  if (json['milestones_url'] != null) {
    data.milestonesUrl = json['milestones_url']?.toString();
  }
  if (json['notifications_url'] != null) {
    data.notificationsUrl = json['notifications_url']?.toString();
  }
  if (json['labels_url'] != null) {
    data.labelsUrl = json['labels_url']?.toString();
  }
  if (json['releases_url'] != null) {
    data.releasesUrl = json['releases_url']?.toString();
  }
  if (json['deployments_url'] != null) {
    data.deploymentsUrl = json['deployments_url']?.toString();
  }
  if (json['created_at'] != null) {
    data.createdAt = json['created_at']?.toString();
  }
  if (json['updated_at'] != null) {
    data.updatedAt = json['updated_at']?.toString();
  }
  if (json['pushed_at'] != null) {
    data.pushedAt = json['pushed_at']?.toString();
  }
  if (json['git_url'] != null) {
    data.gitUrl = json['git_url']?.toString();
  }
  if (json['ssh_url'] != null) {
    data.sshUrl = json['ssh_url']?.toString();
  }
  if (json['clone_url'] != null) {
    data.cloneUrl = json['clone_url']?.toString();
  }
  if (json['svn_url'] != null) {
    data.svnUrl = json['svn_url']?.toString();
  }
  if (json['homepage'] != null) {
    data.homepage = json['homepage']?.toString();
  }
  if (json['size'] != null) {
    data.size = json['size']?.toInt();
  }
  if (json['stargazers_count'] != null) {
    data.stargazersCount = json['stargazers_count']?.toInt();
  }
  if (json['watchers_count'] != null) {
    data.watchersCount = json['watchers_count']?.toInt();
  }
  if (json['language'] != null) {
    data.language = json['language']?.toString();
  }
  if (json['has_issues'] != null) {
    data.hasIssues = json['has_issues'];
  }
  if (json['has_projects'] != null) {
    data.hasProjects = json['has_projects'];
  }
  if (json['has_downloads'] != null) {
    data.hasDownloads = json['has_downloads'];
  }
  if (json['has_wiki'] != null) {
    data.hasWiki = json['has_wiki'];
  }
  if (json['has_pages'] != null) {
    data.hasPages = json['has_pages'];
  }
  if (json['forks_count'] != null) {
    data.forksCount = json['forks_count']?.toInt();
  }
  if (json['archived'] != null) {
    data.archived = json['archived'];
  }
  if (json['disabled'] != null) {
    data.disabled = json['disabled'];
  }
  if (json['open_issues_count'] != null) {
    data.openIssuesCount = json['open_issues_count']?.toInt();
  }
  if (json['forks'] != null) {
    data.forks = json['forks']?.toInt();
  }
  if (json['open_issues'] != null) {
    data.openIssues = json['open_issues']?.toInt();
  }
  if (json['watchers'] != null) {
    data.watchers = json['watchers']?.toInt();
  }
  if (json['default_branch'] != null) {
    data.defaultBranch = json['default_branch']?.toString();
  }
  if (json['score'] != null) {
    data.score = json['score']?.toDouble();
  }
  return data;
}

Map<String, dynamic> searchItemToJson(SearchItem entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['node_id'] = entity.nodeId;
  data['name'] = entity.name;
  data['full_name'] = entity.fullName;
  data['private'] = entity.private;
  data['html_url'] = entity.htmlUrl;
  data['description'] = entity.description;
  data['fork'] = entity.fork;
  data['url'] = entity.url;
  data['forks_url'] = entity.forksUrl;
  data['keys_url'] = entity.keysUrl;
  data['collaborators_url'] = entity.collaboratorsUrl;
  data['teams_url'] = entity.teamsUrl;
  data['hooks_url'] = entity.hooksUrl;
  data['issue_events_url'] = entity.issueEventsUrl;
  data['events_url'] = entity.eventsUrl;
  data['assignees_url'] = entity.assigneesUrl;
  data['branches_url'] = entity.branchesUrl;
  data['tags_url'] = entity.tagsUrl;
  data['blobs_url'] = entity.blobsUrl;
  data['git_tags_url'] = entity.gitTagsUrl;
  data['git_refs_url'] = entity.gitRefsUrl;
  data['trees_url'] = entity.treesUrl;
  data['statuses_url'] = entity.statusesUrl;
  data['languages_url'] = entity.languagesUrl;
  data['stargazers_url'] = entity.stargazersUrl;
  data['contributors_url'] = entity.contributorsUrl;
  data['subscribers_url'] = entity.subscribersUrl;
  data['subscription_url'] = entity.subscriptionUrl;
  data['commits_url'] = entity.commitsUrl;
  data['git_commits_url'] = entity.gitCommitsUrl;
  data['comments_url'] = entity.commentsUrl;
  data['issue_comment_url'] = entity.issueCommentUrl;
  data['contents_url'] = entity.contentsUrl;
  data['compare_url'] = entity.compareUrl;
  data['merges_url'] = entity.mergesUrl;
  data['archive_url'] = entity.archiveUrl;
  data['downloads_url'] = entity.downloadsUrl;
  data['issues_url'] = entity.issuesUrl;
  data['pulls_url'] = entity.pullsUrl;
  data['milestones_url'] = entity.milestonesUrl;
  data['notifications_url'] = entity.notificationsUrl;
  data['labels_url'] = entity.labelsUrl;
  data['releases_url'] = entity.releasesUrl;
  data['deployments_url'] = entity.deploymentsUrl;
  data['created_at'] = entity.createdAt;
  data['updated_at'] = entity.updatedAt;
  data['pushed_at'] = entity.pushedAt;
  data['git_url'] = entity.gitUrl;
  data['ssh_url'] = entity.sshUrl;
  data['clone_url'] = entity.cloneUrl;
  data['svn_url'] = entity.svnUrl;
  data['homepage'] = entity.homepage;
  data['size'] = entity.size;
  data['stargazers_count'] = entity.stargazersCount;
  data['watchers_count'] = entity.watchersCount;
  data['language'] = entity.language;
  data['has_issues'] = entity.hasIssues;
  data['has_projects'] = entity.hasProjects;
  data['has_downloads'] = entity.hasDownloads;
  data['has_wiki'] = entity.hasWiki;
  data['has_pages'] = entity.hasPages;
  data['forks_count'] = entity.forksCount;
  data['archived'] = entity.archived;
  data['disabled'] = entity.disabled;
  data['open_issues_count'] = entity.openIssuesCount;
  data['forks'] = entity.forks;
  data['open_issues'] = entity.openIssues;
  data['watchers'] = entity.watchers;
  data['default_branch'] = entity.defaultBranch;
  data['score'] = entity.score;
  return data;
}
