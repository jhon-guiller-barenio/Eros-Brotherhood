# Eros Brotherhood

Minimal black-and-red editorial website with a five-photo Pinterest fashion strip, activities, Clerk member sign-in/sign-out, attendance and a role-protected admin console.

## Deployment status
The private Sites preview is a visual preview with clearly labeled example gatherings. Real sign-in, admin actions and attendance need the Vercel Node API and credentials below. No preview attendance is stored, and there is no insecure demo-admin account.

Vercel's connected account returned 403 permission errors for project creation. No Vercel project or deployment was created in this session. The Vercel CLI was unavailable.

## Deploy to Vercel
1. Import this folder into a GitHub repository and import that repository in Vercel, or run `npx vercel --prod` from this folder. Framework preset: Other; output directory: dist. The `/api/portal.js` file runs as a Vercel Node function. Install dependencies with `npm install`.
2. The Eros Brotherhood Clerk development application has been created with email sign-in: app_3KqPHCpn8wTuLRKYaB0eyFGr3Xc. Its publishable key is provided in .env.example. Add its secret key through Vercel environment variables. Add the deployed domain as an allowed origin/redirect destination. Do not reuse another project's Clerk keys.
3. Add Vercel environment variables: `CLERK_PUBLISHABLE_KEY`, `CLERK_SECRET_KEY`, `DATABASE_URL` (pooled Neon PostgreSQL connection), and `APP_URL` (exact https origin of this website, without trailing slash). Secret keys remain server-side; only the Clerk publishable key is returned to the browser.
4. Run schema.sql in the new database's SQL editor before enabling member features. Tables start empty; example gatherings are not real records.
5. Sign up, then set that user's public metadata in the Clerk dashboard to `{ "role": "admin" }`. Only server-verified metadata grants access. The footer Admin access button opens the dashboard for administrators.
6. Redeploy after adding environment variables.

## Behavior
Admins create plain-text activities with a title, description, location and start/end time; new records appear for members. Members check in only during the activity window, once per event. Date inputs use the administrator's local timezone and are stored in UTC. Members see their attendance; admins see sign-in/sign-out events, check-ins, created activities and CSV export. Member count reflects members recorded in the activity log. Session events record portal actions, not a full Clerk security audit or presence tracker. Closing a browser does not produce a sign-out record. API inputs are validated and queries parameterized. Attendance identity and admin permissions are verified server-side.

## Verification still required
The JS source was syntax checked. Live Clerk authentication, database operations, images in a rendered browser, and Vercel runtime behavior could not be verified in this environment. After setup, test member signup/login/logout, deny member access to admin API, publish an activity, check in within its window, reject duplicate/out-of-window check-ins, and export attendance.

## Photography
Pinterest editorial references (not Eros members or endorsements). Sources are also linked in the site footer. Confirm permission for public commercial use or replace with licensed/owned photos before a public launch.
- https://www.pinterest.com/pin/32440059823576911/
- https://www.pinterest.com/pin/140596819604566401/
- https://www.pinterest.com/pin/137782069843506170/
- https://www.pinterest.com/pin/754141900117278005/
- https://www.pinterest.com/pin/752804893948611846/
