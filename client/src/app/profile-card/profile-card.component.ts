// Member website (Angular). Shows the profile returned by GET api/members/{id}/profile.
import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-profile-card',
  template: `
    <h2>{{ profile.displayName }}</h2>
    <p>{{ profile.planName }}</p>
  `,
})
export class ProfileCardComponent {
  @Input() profile!: { memberId: number; displayName: string; planName: string };
}
