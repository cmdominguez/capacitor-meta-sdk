import { WebPlugin } from '@capacitor/core';

import type { CapacitorMetaSdkPlugin } from './definitions';

export class CapacitorMetaSdkWeb extends WebPlugin implements CapacitorMetaSdkPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
