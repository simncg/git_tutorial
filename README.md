### **Git Introduction**


### **Setting Up Git Bash**

1. **Setup Git**:
   Before making commits, it's essential to identify yourself:
   ```bash
   git config --global user.name "Simon Caicedo"
   git config --global user.email "simncg@gmail.com"
   ```

### **Commencing with Git**

1. Create a New Repository on GitHub:

   * Go to GitHub.
   * Log in to your account.
   * Click the '+' icon at the top right corner and select 'New repository'.
   * Name your repository. This name doesn't have to match your folder name, but often it's a good idea for clarity.
   * You can choose to initialize the repository with a README, .gitignore, or license. 
   
      - It's a good practice to include a `README.md` file to explain the purpose and structure of the project. 

      - The file `.gitignore` is super important as it allows to specify which are the files that you do not want to include/track in your remote repository. For example, sensitive data or in general data; it's not a good practice to upload data to Git platforms like Github as the objective of these platforms is not data storage. Normally, you can open the .gitignore files with a text editor. 
      
      - GitHub has a size limitation for individual files (100MB) and repositories (recommended not to exceed 1GB). If you're dealing with large datasets, you might run into issues. Large data can also slow down cloning and other operations.


   * Click 'Create repository'.


2. **Initialize a Repository in your local machine** (`git init`): 

   - Open Git Bash

   - You'll use this when you have a project in your local machine that you want to convert to a Git repository.

   - Navigate to your project's directory using `cd path/to/your/project`.
   - Run `git init` to initialize the directory as a Git repository.
     Example:
     ```bash
     cd my_new_project
     git init
     ```

3. **Track & Stage Changes** (`git add`):
   - As you make changes, Git can track them. To stage these changes (i.e., prep them for commit), use:
     ```bash
     git add filename.extension
     ```

     Or to stage all changes:
     ```bash
     git add .
     ```

4. **Committing Changes** (`git commit`):
   - After staging, you 'commit' these changes, which saves them with a descriptive message.
     ```bash
     git commit -m "A descriptive message about the changes made"
     ```

5. **Link the Local Repository to the GitHub Repository:**

   - Link to the remote repository (replace `<username>` with your GitHub username and `<repository>` with the name you gave your repository on GitHub):
     ```bash
     git remote add origin https://github.com/<username>/<repository>.git
     ```


7. **Push Your Local Repository to GitHub:**

   - Push your commits to the master/main branch of your GitHub repository:

   ```bash
   git push -u origin master
   ```
   (Note: GitHub has started naming the default branch as 'main' instead of 'master'. Depending on when your account was created, you may need to use `git push -u origin main` instead.)

   - Now, your local folder should be converted to a Git repository and pushed to GitHub. You can visit the GitHub URL to see your files and commit history.


**What's the difference between git add, git commit and git push? Why is it not included in a single command?**

The use of `git add`, `git commit`, and `git push` as separate commands in the Git version control system provides granularity, flexibility, and safety in managing and publishing code changes:

* **`git add`**: Stages changes for commit.

   - **Granularity**: Allows users to specify which changes should be part of the next commit. This is particularly useful if you have made multiple, unrelated changes and want to commit them as separate logical units (or commits).
   - **Flexibility**: You can incrementally add changes, review them using `git diff --staged`, and modify your staged changes if needed.
   - **Safety**: If you make a mistake (e.g., adding a file you didn’t intend to), you can unstage the changes before committing.

* **`git commit`**: Records changes to the repository.

   - **Granularity**: Commits only the changes that were staged (with `git add`), allowing for clean, well-described commits.
   - **Flexibility**: Enables users to create meaningful commit messages describing the purpose or context of the changes. This assists in code reviews and understanding the history.
   - **Safety**: Commits are local operations. If you commit something you later regret, you can amend the commit, rebase, or even reset without affecting others.

* **`git push`**: Sends committed changes to a remote repository.

   - **Granularity**: You might want to make several local commits before you're ready to share your changes with others. This could be because your changes are work in progress, or because aggregating commits makes the changes easier for others to review.
   - **Flexibility**: Allows for different workflows. For instance, in a feature-branch workflow, developers often push to a feature branch (not the main branch) for collaboration or continuous integration tests.
   - **Safety**: Pushing is a deliberate act. By separating it from committing, you can avoid prematurely sharing unfinished or untested changes. 

Having a single command perform all three operations would make it difficult to:

- Review changes before committing.
- Create separate commits for logically distinct changes.
- Control when changes are shared with others or when they're ready for collaboration or deployment.


### **Other Useful Commands**


7. **Checking Status** (`git status`):
   - This command provides a summary of all changes that are staged, unstaged, and untracked.
     ```bash
     git status
     ```


8. **Cloning** (`git clone`): 

   - You'll use this when you have an existing project hosted on  platforms like GitHub, GitLab, etc. that you want to clone on your local machine. 

   - To work on existing projects hosted on platforms, use `git clone`.
     Example:
     ```bash
     git clone https://github.com/username/project-name.git
     ```



### **Branching & Merging**

- In Git, a branch is a new/separate version of the main repository. Branches allow you to work on different parts of a project without impacting the main branch.

- Let's say you have a large project, and you need to update the design on it. Without Git, we would end up making copies of all the relevant files to avoid impacting the live version and then everything becomes a mess as we start doing copies of the copies. With Git, we just create a new branch, edit the code directly without impacting the main branch, then when we are done with the changes we merge the new branch with the main branch. 


   ![Git-Branches](https://www.nobledesktop.com/image/gitresources/git-branches-merge.png)  


1. **Creating a Branch** (`git checkout -b`):
   ```bash
   git checkout -b feature-new
   ```

2. **Switching Between Branches** (`git checkout`):
   ```bash
   git checkout master
   ```

3. **Listing Branches** (`git branch`):
   - It displays all local branches.
     ```bash
     git branch
     ```

4. **Merging** (`git merge`):
   - To merge changes from one branch (e.g., `feature-new`) into another (e.g., `main`), first switch to the 'receiving' branch, then merge:
     ```bash
     git checkout master
     git merge feature-new
     ```

### **Dealing with Conflicts**

Sometimes, Git cannot automatically merge changes. This is called a merge conflict.

1. **Identifying Conflicts**:
   - Open the conflicted file. Look for conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`). Here I recommend you to use `VSCode` or `nano`. (See last section)

2. **Resolving Conflicts**:
   - Decide which changes to keep, edit the file accordingly, and remove the conflict markers.
  
3. **Finalize Conflict Resolution**:
   ```bash
   git add conflicted_file.extension
   git commit -m "Resolved merge conflicts"
   ```

### **Remote Repositories**

To collaborate with others, you'll push to and pull from remote repositories.

1. **Adding a Remote** (`git remote add`):
   ```bash
   git remote add origin https://github.com/username/project-name.git
   ```

2. **Pushing Changes** (`git push`):
   - Send commits to the remote repository:
     ```bash
     git push origin master
     ```

3. **Pulling Changes** (`git pull`):
   - Retrieve and automatically merge changes from the remote:
     ```bash
     git pull origin master
     ```

### **Navigating History**

1. **Viewing Commit History** (`git log`):
   - This provides a detailed history of commits.
     ```bash
     git log
     ```

### Opening Conflicted Files (in Nano or VSCode):

1. **Using Nano (Text Editor in Bash)**
   If you want to use a terminal-based editor, `nano` is a simple one built into many systems.

   To open a conflicted file:
   ```bash
   nano conflicted_file.extension
   ```

   Within `nano`, you will see conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`). You can directly edit the file to resolve the conflict.

   Nano Controls:
   - `CTRL + O`: Save the file.
   - `CTRL + X`: Exit nano.

2. **Using External Editors (VSCode)**:
   You can also open a conflicted file in any external editor. For example, if you have Visual Studio Code installed and configured, you can do:


-  **Opening the Conflicted File in VSCode**:
   - Navigate to your repository in the terminal and use the following command to open VSCode:
     ```bash
     code .
     ```
   - This opens the entire repository in VSCode. You can also open individual files with `code filename.extension`.

-  **Identifying Conflicts**:
   - In the 'Source Control' view (icon on the side panel that looks like a branch), conflicted files will be highlighted.
   - Click on a conflicted file to open it.

-  **Viewing & Resolving the Conflict**:
   Once inside the file, you'll see the conflict markers, and VSCode will highlight them for clarity:

   ```
   <<<<<<< HEAD
   This is your line of code from the current branch.
   =======
   This is the conflicting line of code from the merging branch.
   >>>>>>> branch-name
   ```

   - **Above and below the `=======` marker**, VSCode will provide clickable action buttons:
     - **Accept Current Change**: This will keep the code from your branch (the part above `=======`) and discard the incoming change.
     - **Accept Incoming Change**: This will keep the code from the merging branch (the part below `=======`) and discard your change.
     - **Accept Both Changes**: This will keep both changes.
     - **Compare Changes**: This allows you to view a side-by-side comparison of the changes.

   Choose the appropriate action based on what changes you want to keep.

   **Example**:
   Suppose you have a file `app.js`, and the conflict is:

   ```
   <<<<<<< HEAD
   console.log("Hello from the main branch!");
   =======
   console.log("Hello from the feature branch!");
   >>>>>>> feature-branch
   ```

   If you want to keep the message from the `feature-branch`, click "Accept Incoming Change". The file will then be:

   ```
   console.log("Hello from the feature branch!");
   ```

- **Finalize the Resolution**:
   - After resolving the conflict, save the file in VSCode.
   - Go back to your terminal or use the integrated terminal in VSCode:
     ```bash
     git add app.js
     git commit -m "Resolved merge conflict in app.js"
     ```

- **Proceed with the Git Workflow**:
   Now that the conflict is resolved, you can continue with your Git workflow, like pushing the changes to a remote repository.

    Using VSCode streamlines the conflict resolution process with its visual aids and one-click resolution options.


-  **Finalizing the Resolution**:
   After resolving the conflict and saving the file, you'll stage and commit the change:
   
   ```bash
   git add conflicted_file.extension
   git commit -m "Resolved merge conflict in conflicted_file.extension"
   ```


- It often helps to discuss with other contributors to understand the context of their changes and make the best decision.