# https://reformatcode.com/code/git/automatic-merge-branch-into-master-on-sucessful-build-in-travis
# https://github.com/cdown/travis-automerge/blob/master/travis-automerge
# https://chrisdown.name/2015/09/27/auto-merging-successful-builds-from-travis-ci.html
echo "merge.sh"

echo "disk free"
df -h


export GIT_COMMITTER_EMAIL='travis@travis'
export GIT_COMMITTER_NAME='Travis CI'

if [ "$TRAVIS_BRANCH" == "master" ]; then
    echo "merge into production; check out deep repo"
    # https://stackoverflow.com/a/32580822/1007926
    echo "git clone git@github.com:${TRAVIS_REPO_SLUG}.git"
    git clone git@github.com:${TRAVIS_REPO_SLUG}.git $TRAVIS_REPO_SLUG
    cd $TRAVIS_REPO_SLUG
    echo "git checkout -qf $TRAVIS_COMMIT"
    git checkout -qf $TRAVIS_COMMIT
    echo "git checkout production"
    git checkout production || exit
    echo "git merge $TRAVIS_COMMIT"
    git merge --squash "$TRAVIS_COMMIT" || exit
    echo "git commit --no-edit"
    git commit --no-edit
    echo "remotes"
    git remote -v
    echo "git push origin production"
    git push --verbose origin production
    echo "pushed"
    echo "git remote show origin"
    git remote show origin
fi

if [ "$TRAVIS_BRANCH" == "production" ]; then
    echo "CI build of production branch successful"
    docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
    echo "logged into Docker Hub"
    echo "docker push $TRAVIS_REPO_SLUG"
    docker push $TRAVIS_REPO_SLUG
fi
