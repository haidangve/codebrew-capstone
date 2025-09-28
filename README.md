# Team Git Workflow Guide

This guide outlines a simple and effective Git workflow for small group collaboration. It explains each step, the commands involved, and the reasoning behind them to maintain a clean and conflict-minimized Git history.

---

## Step 1: Pull the Latest `main` Branch
```bash
git checkout main
git pull origin main
```
Ensure you're starting from the most recent `main` to avoid conflicts.

---

## Step 2: Create a Feature Branch
```bash
git checkout -b feature/your-feature-name
```
Create a branch named after the task, like `feature/login-page`.

---

## Step 3: Make and Commit Your Changes
Test locally first. Then:
```bash
git add .
git commit -m "Short description of your changes"
```
Keep commit messages clear and concise.

---

## Step 4: Squash Commits into One
Before pushing:
```bash
git rebase -i main
```
Use `squash` to combine commits and write one clear message. Example:
```
pick 123abc Add login UI
squash 456def Connect to state
squash 789ghi Fix validation
```

---

## Step 5: Merge Latest `main` into Your Branch
```bash
git checkout main
git pull origin main

git checkout feature/your-feature-name
git merge main
```
Test again to ensure everything still works.

---

## Step 6: Push to Remote Repository
```bash
git push origin feature/your-feature-name
```
This makes your code available for review.

---

## Step 7: Open a Pull Request (PR)
- Open a PR from `feature/...` to `main`
- Request team review

---

## Step 8: Make Revisions (If Needed)
```bash
git add .
git commit -m "Make changes from review"
git push
```
Updates the PR automatically.

---

## Step 9: Merge the PR into `main`
Use "Squash and Merge" or a regular merge, depending on your strategy.

---

## Step 10: Sync Your Local `main` Again
```bash
git checkout main
git pull origin main
```
Stay up to date for your next task.

---

## Optional: Delete Your Local Feature Branch
```bash
git branch -d feature/your-feature-name
```
Keeps your local environment clean.

---

This process works best for small teams (2–5 people) where clarity, coordination, and minimal merge conflicts are key.
