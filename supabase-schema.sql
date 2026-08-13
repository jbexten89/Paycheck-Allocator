-- Paycheck Allocator — Supabase schema
-- Run this once in your Supabase project's SQL Editor.

create table if not exists public.paycheck_data (
  user_id     uuid primary key references auth.users(id) on delete cascade default auth.uid(),
  payload     jsonb not null default '{}'::jsonb,
  updated_at  timestamptz not null default now()
);

alter table public.paycheck_data enable row level security;

drop policy if exists "own rows select" on public.paycheck_data;
drop policy if exists "own rows insert" on public.paycheck_data;
drop policy if exists "own rows update" on public.paycheck_data;
drop policy if exists "own rows delete" on public.paycheck_data;

create policy "own rows select" on public.paycheck_data
  for select using (auth.uid() = user_id);
create policy "own rows insert" on public.paycheck_data
  for insert with check (auth.uid() = user_id);
create policy "own rows update" on public.paycheck_data
  for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "own rows delete" on public.paycheck_data
  for delete using (auth.uid() = user_id);
