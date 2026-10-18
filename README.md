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


## October design and access update
- Replaced the fashion strip with two supplied reference portraits and three matching editorial portraits from Pinterest. Updated the hero, typography, cards and responsive spacing.
- Separate sign-in and sign-up controls initialize Clerk even when attendance storage is unavailable. Sign-out is independent of event logging.
- The Eros development publishable key is wired in as a public fallback. No secret key is committed.
- Admin access uses the server-only ADMIN_EMAILS comma-separated allowlist or Clerk public metadata role=admin. No personal owner email is committed. Unverified emails do not receive allowlist privileges.
- After Vercel deployment, add CLERK_SECRET_KEY and DATABASE_URL, run schema.sql, and set APP_URL to the deployed origin. VERCEL_PROJECT_PRODUCTION_URL is used if APP_URL is omitted. Set your user public metadata in Clerk to role=admin, or set ADMIN_EMAILS privately in Vercel, then sign up and verify your email before opening Admin access.
- Clerk currently uses its development instance. Set up the production Clerk instance and domain before a public production launch, and replace CLERK_PUBLISHABLE_KEY, CLERK_SECRET_KEY and dist/clerk-config.json with matching production settings.
- The connected Vercel account contained no Eros project during this update. Live authentication and database operations remain unverified until deployment and environment setup.

### Updated image sources
User references: 758.jpg and 762.jpg. Pinterest: https://www.pinterest.com/pin/977984875306795007/, https://www.pinterest.com/pin/99853316718155050/, https://www.pinterest.com/pin/416442296795515555/. These are editorial inspiration, not Eros member identities or endorsements.
