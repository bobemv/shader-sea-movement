Shader "Custom/Rotate"
{

    Properties {
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _Speed("Speed Rotation", float) = 1.0
    }
    Subshader {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            #define M_PI 3.1415926535897932384626433832795
            struct vstructure 
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float3 normal : NORMAL;
            };

            struct fstructure
            {
                float4 vertex : SV_POSITION;
                float2 texcoord : TEXCOORD0;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _Speed;
            
            


            fstructure vert (vstructure vs)
            {
                fstructure o;
                float rot_x = 0;
                float rot_y = M_PI * _Time.x;
                float rot_z = 0;
                float3x3 mat_x = float3x3(
                    1, 0, 0,
                    0, cos(rot_x), sin(rot_x),
                    0, -sin(rot_x), cos(rot_x)
                );
                float3x3 mat_y = float3x3(
                    cos(rot_y), 0, -sin(rot_y),
                    0, 1, 0,
                    sin(rot_y), 0, cos(rot_y)
                );
                float3x3 mat_z = float3x3(
                    cos(rot_z), sin(rot_z), 0,
                    -sin(rot_z), cos(rot_z), 0,
                    0, 0, 1
                );
                
                float angle = acos(dot(vs.vertex.xyz, float3(1, 0, 0)));
                //vs.vertex.z += sin(vs.vertex.y + _Time.y);
                vs.vertex.xyz += cos(length(vs.vertex.xz) * _Time.y * 7) / 70;

                //vs.vertex.y += sin(vs.vertex.y);
                //vs.vertex.z += sin(vs.vertex.z);
                
                vs.vertex.xyz = mul(vs.vertex.xyz, mat_x);
                vs.vertex.xyz = mul(vs.vertex.xyz, mat_y);
                vs.vertex.xyz = mul(vs.vertex.xyz, mat_z);
                
                
                o.vertex = UnityObjectToClipPos(vs.vertex);
                o.texcoord = TRANSFORM_TEX(vs.uv, _MainTex);

                return o;
            }

            fixed4 frag(fstructure i) : SV_Target
            {
                float4 textureColor = tex2D(_MainTex, i.texcoord);
                return textureColor;
            }

            ENDCG
        }
    }

}
