import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import UvNowView from '../views/UvNowView.vue'
import AwarenessView from '../views/AwarenessView.vue'
import ResourcesView from '../views/ResourcesView.vue'
import { m } from 'vue-router/dist/index-DFCq6eJK'

const routes = [
  {
    path: '/',
    redirect: '/home',
  },
  {
    path: '/home',
    name: 'Home',
    component: HomeView,
    meta: { public: true },
  },
  {
    path: '/uv-now',
    name: 'UvNow',
    component: UvNowView,
    meta: { public: true },
  },
  {
    path: '/awareness',
    name: 'Awareness',
    component: AwarenessView,
    meta: { public: true }
  },
  {
    path: '/resources',
    name: 'Resources',
    component: ResourcesView,
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
