#!/bin/bash

# Automated Deployment &amp; Rollback Script (Chapter 7)

ENVIRONMENT=${1:-staging}
APP_BINARY=&quot;./build/GradeSystem&quot;
DEPLOY_DIR=&quot;./environments/${ENVIRONMENT}/app&quot;
BACKUP_DIR=&quot;./environments/${ENVIRONMENT}/backup&quot;

echo &quot;==========================================&quot;
echo &quot; Deploying GradeSystem to: ${ENVIRONMENT^^}&quot;
echo &quot;==========================================&quot;
mkdir -p &quot;$DEPLOY_DIR&quot; &quot;$BACKUP_DIR&quot;

# Step 1: Backup current live version (if one exists)
if [ -f &quot;$DEPLOY_DIR/GradeSystem&quot; ]; then
echo &quot;[Step 1] Creating backup of current version...&quot;
cp &quot;$DEPLOY_DIR/GradeSystem&quot; &quot;$BACKUP_DIR/GradeSystem.bak&quot;
else
echo &quot;[Step 1] First-time deployment. No backup needed.&quot;
fi

# Step 2: Deploy new compiled binary
echo &quot;[Step 2] Copying new version to $DEPLOY_DIR...&quot;
cp &quot;$APP_BINARY&quot; &quot;$DEPLOY_DIR/GradeSystem&quot;
chmod +x &quot;$DEPLOY_DIR/GradeSystem&quot;

# Step 3: Post-deployment Health Check
echo &quot;[Step 3] Running post-deployment health check...&quot;
&quot;$DEPLOY_DIR/GradeSystem&quot; --health-check

if [ $? -ne 0 ]; then
echo &quot;[ALERT] Health check FAILED! Rolling back to backup...&quot;
if [ -f &quot;$BACKUP_DIR/GradeSystem.bak&quot; ]; then
cp &quot;$BACKUP_DIR/GradeSystem.bak&quot; &quot;$DEPLOY_DIR/GradeSystem&quot;
echo &quot;[ROLLBACK] Previous version restored.&quot;
fi
exit 1
fi

echo &quot;[SUCCESS] ${ENVIRONMENT^^} deployment passed health check!&quot;
&quot;$DEPLOY_DIR/GradeSystem&quot;
exit
