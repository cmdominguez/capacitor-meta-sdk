import { registerPlugin } from '@capacitor/core';

import type { CapacitorMetaSdkPlugin } from './definitions';

const CapacitorMetaSdk = registerPlugin<CapacitorMetaSdkPlugin>('CapacitorMetaSdk', {
  web: () => import('./web').then((m) => new m.CapacitorMetaSdkWeb()),
});

export * from './definitions';
export { CapacitorMetaSdk };
